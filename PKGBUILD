# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chkrootkit
pkgver=0.53
pkgrel=1
pkgdesc="Locally checks for signs of a rootkit"
arch=( 'i686' 'x86_64' )
url="http://www.chkrootkit.org/"
license=( 'CUSTOM' )
_pkgname=chkrootkit
install=
changelog=
noextract=()
source=("ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.tar.gz"
        "chkrootkit.tar.gz.sig")
sha512sums=('f8de19d0a61ccb6ac184ad6642d78041729cba799eedcc8088cb6d2c5cf4de0574c6083caad364576a601265322e61c183b266304f00667527bf29fdc51359c7'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
