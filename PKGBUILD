# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=pisg-fixed
pkgver=0.73
pkgrel=1
pkgdesc="An IRC log parser (fixed)"
arch=( 'i686' 'x86_64' )
url="http://pisg.sourceforge.net/"
license=( 'GPL' )
_pkgname=pisg-fixed
conflicts=( 'pkg''pkg')
install=
changelog=
noextract=()
source=("http://prdownloads.sourceforge.net/pisg/pisg-0.73.tar.gz"
        "pisg-0.73.tar.gz.sig")
sha512sums=('290656fc556090fa8a263eaf123bad8e12b0ac50a2c1eb4619c50faf70fd3ee8afc7a8d97dbc4ff6338dd0fa9f73f7b19c60ca996b6612def95f1c494b3ef91e'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
