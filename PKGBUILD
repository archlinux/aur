# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-menu3
pkgver=1.0
pkgrel=1
pkgdesc="A simple Python 3.x command line menu system"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/menu3"
license=('GPL')
depends=('')
optdepends=('')
makedepends=('')
_pkgname=python-menu3
provides=("python-menu3")
#conflicts=("python-menu3")
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/83/00/9cbf6fbe63286cf919e20292663273884ecd9c87d682b4f741e513f7473a/menu3-1.0.zip"
        "menu3-1.0.zip.sig")
sha512sums=('cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
