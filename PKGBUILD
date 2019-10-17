# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-blkinfo
pkgver=0.1.2
pkgrel=1
pkgdesc="a python library to list information about all available or the specified block devices"
arch=( 'i686' 'x86_64' )
url="https://github.com/grinrag/blkinfo"
license=( 'GPL3' )
depends=( 'python3' 'util-linux' )
_pkgname=python-blkinfo
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/ae/ef/d1d8ffa6f54684f24c5c8dca3a9e5acc19ab752bc4671de9a830a7dc79cb/blkinfo-0.1.2.tar.gz"
        "blkinfo-0.1.2.tar.gz.sig")
sha512sums=('1fc84964e5b253dd2c179769499af996a622bd3f8a3ef5acce894c2f538597521f7f8f522dc2b1e69909bfc632f786714efe81eb9d7727442dc14ea67375b528'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
