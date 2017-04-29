# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-pylibacl
pkgver=0.5.3
pkgrel=1
pkgdesc="A python extension module that allows you to manipulate the POSIX.1e ACLs. (Fixed for python 3)"
arch=( 'i686' 'x86_64' )
url="http://pylibacl.k1024.org/"
license=( 'LGPL' )
depends=( 'python' 'python2' )
makedepends=( 'python-distribute' 'python2-distribute' 'python' 'python2' )
_pkgname=python-pylibacl
conflicts=( 'pkg''pkg')
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/pylibacl/pylibacl-0.5.3.tar.gz"
        "pylibacl-0.5.3.tar.gz.sig")
sha512sums=('7d58a3a64e939a8891333a0fb8aa6e12dcbbf09e4e829f86fd1bb41693dd4f734a4ab907770e8e341476594aa495b5308a26d495ebf251dcda308ee46e5392ad'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
