# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=clinfo
pkgver=2.0.15.03.24
pkgrel=1
pkgdesc="Print all known information about all available OpenCL platforms and devices in the system"
arch=(i686 x86_64)
url="https://github.com/Oblomov/clinfo"
license=('custom:Public Domain')
depends=(libcl)
makedepends=(opencl-headers)
provides=(clinfo)
conflicts=(clinfo)
replaces=(clinfo)
source=(git+https://github.com/oblomov/clinfo.git)
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    echo $(git describe --tags | cut -f1 -d"-")
}

build() {
    cd ${srcdir}/${pkgname}
    make
}

package() {
    cd ${srcdir}/${pkgname}
    install -D -m755 clinfo "${pkgdir}/usr/bin/clinfo"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 man/clinfo.1 "${pkgdir}/usr/share/man/man1/clinfo.1"
}