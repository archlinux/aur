# Maintainer: Jeff Hughes <jeff.hughes@gmail.com>
pkgname=shellcaster-bin
_pkgname=shellcaster
pkgver=0.8.2
pkgrel=2

pkgdesc="ncurses-based TUI podcast manager"
arch=('x86_64')
url="https://github.com/jeff-hughes/shellcaster"
license=('GPL3')

depends=('sqlite>=3.23.0' 'openssl>1.1.0')

provides=('shellcaster')
conflicts=('shellcaster')

backup=("etc/${_pkgname}/config.toml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeff-hughes/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")

sha256sums=('8740a073ec53d25cb211230ad23f7aa674b0c6da58bde6482455b28b1b55354b')

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 ./shellcaster "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ./config.toml "${pkgdir}/etc/${_pkgname}/config.toml"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
