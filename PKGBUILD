# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-grpcio
pkgver=1.7.0
pkgrel=1
pkgdesc="HTTP/2-based RPC framework"
arch=( 'i686' 'x86_64' )
url="https://grpc.io/"
license=( 'APACHE' )
_pkgname=python-grpcio
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/d3/15/370c1cf77fe4147ba5565048545f2cf0aca4dafc9e9a2330c22506443b7e/grpcio-1.7.0.tar.gz"
        "grpcio-1.7.0.tar.gz.sig")
sha512sums=('551e0f4078a4d0b48d6686ebdc80d44d9bd7718f4e794995f9cd09322ba90bb4063578478ff8d721eaaab37c911ab09a9b8fd61be7886c5fa943ebab099fb162'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
