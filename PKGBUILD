# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=cimplefetch
pkgver=0.3
pkgrel=1
pkgdesc="A simple program to fetch system information written in C"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/caverym/cimplefetch"
license=('GPL3')
deppends=('libcimply')
source=("https://github.com/caverym/cimplefetch/archive/${pkgver}.tar.gz")
sha256sums=('abc8132ac0f82608c24656bde2d5e16a43d58844ec168036e27816bb6606435a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

