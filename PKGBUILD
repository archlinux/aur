# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-grpcio-tools
pkgver=1.7.0
pkgrel=1
pkgdesc="Python protobuf generator for GRPC"
arch=( 'i686' 'x86_64' )
url="https://grpc.io/"
license=( 'APACHE' )
_pkgname=python-grpcio-tools
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/44/09/06843f65aa75d8d1852acc8983ea070a273f2005995a2fe316d142f6f2c3/grpcio-tools-1.7.0.tar.gz"
        "grpcio-tools-1.7.0.tar.gz.sig")
sha512sums=('9205f9804b13f01d2543e037496bcab1eb026d35daa0f3e3a3da87cfb561be5f61da09411757a82e08a21f77dcdc10694ea3aa1a4668c6689cdbc4223991e8d7'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
