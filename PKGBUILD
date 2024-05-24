# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=docker-credential-secretservice-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Store docker credentials using the D-Bus Secret Service"
arch=('x86_64' 'aarch64')
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=()
makedepends=()
options=("!debug")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=(
    "${pkgname}-x86_64::${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}.linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE"
)

source_aarch64=(
    "${pkgname}-aarch64::${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}.linux-arm64"
    "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE"
)

b2sums_x86_64=('8ba2ea951618cbd35dc8e138558e5d5625fd0ef622fad1d1662dffc21291c55a77070fde65f1082b22dd92950d84f82a9f4f4ffcc51c9b98e359d2b7a6fe0a09'
               '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')
b2sums_aarch64=('646e7503680825149c2d83d1265ee462df5c5c3db3d42065c4d31bb21cf53ccb4c4a88f41572485d8c53bbd632c8e98ee1eb01ae91e6d894a3f4058e4a8c2dc8'
                '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')

package() {
    install -D -m 0755 "${srcdir}/${pkgname}-${arch}" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
