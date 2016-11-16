
# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

pkgname=python-pychroot
pkgver=0.9.16
pkgrel=1
pkgdesc="A python library and CLI tool that simplifies chroot handling"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/pychroot/"
license=( 'BSD' )
depends=( 'python' )
makedepends=( 'python' 'python-snakeoil' )
_pkgname=python-pychroot

install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/71/f0/c21a8e3f0b573424daa61700b08e76867742e43105631a996a22b99b1099/pychroot-0.9.16.tar.gz"
        "pychroot-0.9.16.tar.gz.sig")
sha512sums=('6e35c7b40ad27d234c855abf1857aa6579583d848b111559de21edfa0bc6987e08d1d122924101e2e9bdf37886591b7291a607ed22cf2c50aa11b32f7ea65495'
            'SKIP')

build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}

package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
