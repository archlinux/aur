# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=nmtree
pkgver=20171109
pkgrel=1
pkgdesc="NetBSD's mtree (supports legacy mtree spec, etc.)"
arch=( 'i686' 'x86_64' )
url="https://www.netbsd.org/"
license=( 'CUSTOM' )
depends=( 'libnbcompat' )
makedepends=( 'libnbcompat' )
_pkgname=nmtree
provides=( 'mtree' 'mtree-git' )
conflicts=( 'pkg''pkg''pkg')
install=
changelog=
noextract=()
source=("http://g.rainwreck.com/index.html"
        "index.html.sig")
sha512sums=('2b0be4eb8ab3a9ac98aaac13c00ac283a0cf958f469367c0291aad84d771455626f54cdbfbd0d0604028471a5686939f29b4601df9efef1b08876d9be5f67516'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
