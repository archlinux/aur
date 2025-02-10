# Maintainer: Alexander Mot <alexander at amot dot dev>
pkgname=timestamp
pkgver=1.2.0
pkgrel=1
pkgdesc="Configurable tool to rename files with dates from existing EXIF, XMP, or inode metadata"
arch=('x86_64')         # Not yet tested on anything else
url="https://github.com/amot-dev/timestamp"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'exiv2' 'yaml-cpp')
makedepends=('gcc>=14')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amot-dev/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d9769e9b8f3b281a2a83bc511692e4ed30067baa3e3819daddf19165dca96c4f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
