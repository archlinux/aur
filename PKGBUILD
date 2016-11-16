
# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

pkgname=python-snakeoil
pkgver=0.7.1
pkgrel=1
pkgdesc="Provides common functionality and useful optimizations"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/snakeoil"
license=('BSD' )
depends=( 'python' )
makedepends=( 'python' )
_pkgname=python-snakeoil

install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/a8/0c/64adb0c5f5493e97ed2ba8d1e17e3900453b49ce15eadba17fda20150eb3/snakeoil-0.7.1.tar.gz"
        "snakeoil-0.7.1.tar.gz.sig")
sha512sums=('1c0d03d50a1738cbb3cceecec9445585d089ea535657467871930cca7282d3426780451fb45774e16b05714a1da13766d68f62def7a2d957e2124bd71335d0a0'
            'SKIP')

build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}

package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
