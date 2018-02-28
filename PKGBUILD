# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-libguestfs
pkgver=1.38.0
pkgrel=1
pkgdesc="Python bindings for libguestfs"
arch=( 'i686' 'x86_64' )
url="http://libguestfs.org/"
license=( 'LGPL3' )
depends=( 'python' 'libguestfs' )
_pkgname=python-libguestfs
install=
changelog=
noextract=()
source=("http://download.libguestfs.org/python/guestfs-1.38.0.tar.gz"
        "guestfs-1.38.0.tar.gz.sig")
sha512sums=('35aa80c6889fd11aeac364436e6dfe5199b5a9771937085a45c9cc1d6943559cd33fda7e28d62f54ba06e10b5f0f8e462dc94d35621c7da3bc82467f60d988cd'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
