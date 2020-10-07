# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=nquake-common
pkgver=2.5
pkgrel=1
pkgdesc="Common files for nquake (client) and nquakesv (server)"
arch=( 'i686' 'x86_64' )
url="https://www.nquake.com/"
license=( 'CC0' '1.0' )
makedepends=( 'dos2unix' )
_pkgname=nquake-common
install=
changelog=
noextract=()
source=("http://quakeservers.nquake.com/qsw106.zip"
        "qsw106.zip.sig")
sha512sums=('32df717a4a8f121358243333c30d8d0e5d43ee04f3ee8175a894199b8932e90ebedc6b687c25207c6191dbf25363307f09f8c1dc767b58e254e015c150217384'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
