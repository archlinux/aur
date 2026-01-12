# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=docker-credential-secretservice-bin
pkgver=0.9.5
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
    "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}.linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE"
)

source_aarch64=(
    "${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/docker-credential-secretservice-v${pkgver}.linux-arm64"
    "LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v${pkgver}/LICENSE"
)

b2sums_x86_64=('8e69561d3df1e998e76db16d04f4fdca0b92ab78202deed1ce02c014d75ed8ea9599e122290b9c02fbb074901196913b7fc16d03c42ad23ed6f2844e98237d1f'
               '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')
b2sums_aarch64=('2a487f1e6b843f1f2f932127d1e03c262712bf26cb7062a282b9e8dc92165d7811385961395a2a2e6a15dd62bfef20b1c9420017be2436558f54ee05a1a06196'
                '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')

package() {
    install -D -m 0755 "${srcdir}/${pkgname}-${pkgver}-${arch}" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
