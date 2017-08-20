# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-inotify
pkgver=0.2.8
pkgrel=1
pkgdesc="Access inotify events via python (this is NOT related to python-pynotify!)"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/inotify"
license=( 'GPL2' )
depends=( 'python' 'python2' )
makedepends=( 'python' 'python2' )
_pkgname=python-inotify
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/ab/3b/ad48cb45af4af32341fc6bf28497081a885d1e23777d2827f3c61d734f02/inotify-0.2.8.tar.gz"
        "inotify-0.2.8.tar.gz.sig")
sha512sums=('06f0df041cd5071a1e844f329fa3828a4082d6b2d530e118cafb4e4a19635a0502cc0cdcb2c108fcfa51cd7cc8f3e3e33292d11136b8f068df544a1addfcc54d'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
