# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-mdstat
pkgver=1.0.4
pkgrel=1
pkgdesc="Convert your /proc/mdstat file into an object usable in Python"
arch=( 'i686' 'x86_64' )
url="https://github.com/truveris/py-mdstat/"
license=( 'CUSTOM' )
depends=( 'python' 'python2' 'mdadm' )
makedepends=( 'python' 'python2' 'python-setuptools' 'python2-setuptools' 'mdadm' )
_pkgname=python-mdstat
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/61/57/879865d489c7f56d1b1687866f4e9eaecbc7dce7072bcf5bb4877c66c492/mdstat-1.0.4.tar.gz"
        "mdstat-1.0.4.tar.gz.sig")
sha512sums=('a2894fd20e70f78aa1310792f4322524321d7151085e6caef8e089f05c40334bfff06162b2854b50f33111d0073c4a9378781c79127ff6345eda50d8f9ad3e69'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
