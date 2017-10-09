# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-conversion
pkgver=0.0.3
pkgrel=1
pkgdesc="Utility functions to convert strings to Python types."
arch=( 'i686' 'x86_64' )
url="http://github.com/rca/conversion"
license=( 'APACHE' )
depends=( 'python' 'python2' )
makedepends=( 'python' 'python2' 'python-setuptools' 'python2-setuptools' )
_pkgname=python-conversion
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/6c/09/f03a60daf52e0156d13a92acadf45b59262fbd3956ba275df1ea9b5a5ccd/conversion-0.0.3.tar.gz"
        "conversion-0.0.3.tar.gz.sig")
sha512sums=('ad916391f64618daf5c81d5805ee7f72d78c3a82abac55d58b94f22c96d1b8a06f3be20b41f4a1a62395b373e51552237b07f3322ee568f28dc6d0c261075be3'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
