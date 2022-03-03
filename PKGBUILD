# Maintainer: Jeff Hughes <jeff.hughes@gmail.com>
pkgname=shellcaster-bin
_pkgname=shellcaster
pkgver=2.0.1
pkgrel=1

pkgdesc="Terminal-based TUI podcast manager"
arch=('x86_64')
url="https://github.com/jeff-hughes/shellcaster"
license=('GPL3')

depends=('sqlite>=3.23.0' 'openssl>=1.1.0')

provides=('shellcaster')
conflicts=('shellcaster')

backup=("etc/${_pkgname}/config.toml")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeff-hughes/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux-x86_64.tar.gz")

sha256sums=('57039739f1393283f6d3fd4121ed6d200ff17cecc0d22438172f1c127f9f3cd6')

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 ./shellcaster "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ./config.toml "${pkgdir}/etc/${_pkgname}/config.toml"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
