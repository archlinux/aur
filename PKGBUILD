# Maintainer: Alexander Mot <alexander at amot dot dev>
pkgname=timestamp
pkgver=1.1.1
pkgrel=1
pkgdesc="Rename EXIF and XMP files to reflect date found in metadata"
arch=('x86_64')         # Not yet tested on anything else
url="https://github.com/amot-dev/timestamp"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'exiv2')
makedepends=('gcc>=14')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amot-dev/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a64f0523c7bd527a53fd529d524cdf0d35387aa63858913179faf8b80a37d2e0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
