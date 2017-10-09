# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-lvm2py
pkgver=1.0
pkgrel=1
pkgdesc="A ctypes based binding for lvm’s liblvm2app api"
arch=( 'i686' 'x86_64' )
url="http://xzased.github.com/lvm2py"
license=( 'GPL3' )
depends=( 'python' 'python2' 'lvm2' )
makedepends=( 'python' 'python2' 'lvm2' 'python-setuptools' 'python2-setuptools' )
_pkgname=python-lvm2py
install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/80/11/7540a98afcd08254530bba9f7edec7e0e43f6c0bf433433a3469c03eac6d/lvm2py-1.0.tar.gz"
        "lvm2py-1.0.tar.gz.sig")
sha512sums=('2d3761880ce81a56062ffb489c6f8a0dfb99c0a6deb1b5ee8d5df5e121f25137ef0b49b7d9274cb549f370dfe72933b6bb196f7b2b6c3dec20491d42952ac90c'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
