# Maintainer: Jeff Hughes <jeff.hughes@gmail.com>
pkgname=shellcaster-bin
_pkgname=shellcaster
pkgver=1.2.1
pkgrel=1

pkgdesc="ncurses-based TUI podcast manager"
arch=('x86_64')
url="https://github.com/jeff-hughes/shellcaster"
license=('GPL3')

depends=('ncurses>=6.0' 'sqlite>=3.23.0' 'openssl>=1.1.0')

provides=('shellcaster')
conflicts=('shellcaster')

backup=("etc/${_pkgname}/config.toml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeff-hughes/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux-x86_64.tar.gz")

sha256sums=('df5e752fadd16eaa129544d42e6ce7819a1401e34da7a8d6069740053006bd4c')

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 ./shellcaster "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ./config.toml "${pkgdir}/etc/${_pkgname}/config.toml"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
