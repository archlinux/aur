# Maintainer: arjan5 <aur@anymore.nl>

_pkgname=ntfy
pkgname=${_pkgname}sh-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Send push notifications to your phone or desktop using PUT/POST"
arch=("x86_64")
url="https://github.com/binwiederhier/ntfy"
license=('GPL2')
depends=()
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
backup=('etc/ntfy/config.yml')

sha256sums=('24555c0b0dc6b611c686da169a4ac0a5c9ed6b259e41912fd4c90c25966856ac')

package() {
    cd "${srcdir}/${_pkgname}_${pkgver}_linux_x86_64/"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "config/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "config/config.yml" "${pkgdir}/etc/ntfy/config.yml"
}

