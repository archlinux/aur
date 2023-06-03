pkgname="ccd"
pkgver=2.0.3
pkgrel=1
pkgdesc="Simple astronomical CCD controller "
arch=("x86_64")
url='https://sourceforge.net/projects/cccd/'
license=('GPL3')
makedepends=('libraw')
source=("https://master.dl.sourceforge.net/project/cccd/ccd/${pkgver}/ccd-${pkgver}.tar.bz2")
sha256sums=('9895de36c80fb751192bc3578806ef4aed176e1d902b9851540a0d533845613c')

build() {
    cd "${srcdir}/${pkgname}"
    ./build.sh
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}/build/release/${pkgname}" "${pkgdir}/opt/${pkgname}/"
}
