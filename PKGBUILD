# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=docker-credential-secretservice-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="Store docker credentials using the D-Bus Secret Service"
arch=('x86_64' 'aarch64')
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=()
makedepends=()
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

b2sums_x86_64=('561259323f533608a736d1359b3ddfd9cdb03dc011dfb02be0d8a29302922133acf707284fc9e8e9ea54667b67f2bb158ce21e7b694dbb446e1c3fae897637d4'
               '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')
b2sums_aarch64=('22146c0d6d585e2ecb547416f56d7a244a69696655401ebf9468e816d503d667153993dba040ce41a4d57212044e28951639729a50fec48722a2070e2c1bfa53'
                '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')

package() {
    install -D -m 0755 "${srcdir}/${pkgname}-${arch}" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
