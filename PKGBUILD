# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-hashid
pkgver=3.1.4
pkgrel=1
pkgdesc="Identify the different types of hashes used to encrypt data and especially passwords"
arch=( 'i686' 'x86_64' )
url="https://github.com/psypanda/hashID"
license=( 'GPL3' )
depends=( 'python' 'python2' )
makedepends=( ''python-distribute'' ''python2-distribute'' ''python'' ''python2'' )
_pkgname=python-hashid
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/h/hashID/hashID-3.1.4.zip"
        "hashID-3.1.4.zip.sig")
sha512sums=('598538454578cf71872950d43aab9fa8d274983646e2dc94462e5d3dcb0bee04c923cf8f6769cf5aa1a9d0e825c97cfa2560a11beebf1aeccc40648c90d03567'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
