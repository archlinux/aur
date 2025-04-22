# Maintainer: Alexander Mot <alexander at amot dot dev>
pkgname=timestamp
pkgver=1.3.0
pkgrel=1
pkgdesc="Configurable tool to rename files with dates from existing EXIF, XMP, or inode metadata"
arch=('x86_64')         # Not yet tested on anything else
url="https://github.com/amot-dev/timestamp"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'exiv2' 'yaml-cpp')
makedepends=('gcc>=14')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amot-dev/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70a0e68a5c6449f8017b9c541ab5634c92b6f5b85fcf8054a54ff829de41c805')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
