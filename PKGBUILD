# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-gitpython
pkgver=2.1.1
pkgrel=1
pkgdesc="A python library used to interact with Git repositories"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/GitPython"
license=('BSD')
depends=('python')
optdepends=('')
makedepends=('')
_pkgname=python-gitpython
provides=("python-gitpython")
#conflicts=("python-gitpython")
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/21/13/8d0981cee1c5b9dd7fa9f836ed7c304891686f300572c03a49e52c07c04c/GitPython-2.1.1.tar.gz#md5=77f8339e68dedb6d7c4e26371a588ed9"
        "GitPython-2.1.1.tar.gz#md5=77f8339e68dedb6d7c4e26371a588ed9.sig")
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
