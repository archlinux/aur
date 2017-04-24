# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-steamodd
pkgver=4.21
pkgrel=1
pkgdesc="Python module for working with Steam's API"
arch=( 'i686' 'x86_64' )
url="https://steamodd.readthedocs.io/en/latest/"
license=( 'CUSTOM' )
makedepends=( 'python' 'python-setuptools' 'python2' 'python2-setuptools' )
_pkgname=python-steamodd
install=
changelog=
noextract=()
source=("https://github.com/Lagg/steamodd/archive/v4.21.tar.gz"
        "v4.21.tar.gz.sig")
sha512sums=('5be53dd30476f1bfac725e97f691331f83c09ec44816ea34ae0a6917b74f324020919ffb7ec18e9d39c2f93fd898368fa642ff962625cdcb31e61425d3fb14fd'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
