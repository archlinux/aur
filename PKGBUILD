# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=cimplefetch
pkgver=0.4
pkgrel=1
pkgdesc="A simple program to fetch system information written in C"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/caverym/cimplefetch"
license=('GPL3')
deppends=('libcimply')
source=("https://github.com/caverym/cimplefetch/archive/${pkgver}.tar.gz")
sha256sums=('a7042aa84f7577afe2df7d7406a621ee072fd6bba873d5d48ef35174610c83f2')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    strip "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
    install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

