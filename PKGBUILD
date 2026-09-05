# Maintainer: Soma Zambelly <zambelly dot soma at gmail dot com>
# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=docker-credential-secretservice-bin
pkgver=0.9.9
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

b2sums_x86_64=('342a2a8fe263115428e920eaf35892e40dc44dd7251988c12da0b02d6dbd126cb1d4848db9c57ccf57c657492fc73847cf581b87dd647cc602b77f45c35965e6'
               '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')
b2sums_aarch64=('3a4f54233a1eb7fbf6918227ceb804c0280d89ea85538a9329306701a56d9b6e4e8efaf52f0df91c39b375eff0313b50e0eddf8071eedd352b8d320e5f8e9699'
                '7e5e1fc19b9fd4204acb61ea546d7ff33b1b7d913a27680a4a032365312e4a488ff4b3ac498d8c80c8ce374d7700085ed71b46f75438cd9d6bbee653be209806')

package() {
    install -D -m 0755 "${srcdir}/${pkgname}-${pkgver}-${arch}" "${pkgdir}/usr/bin/docker-credential-secretservice"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
