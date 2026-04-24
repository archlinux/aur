# Maintainer: agony <27015 at riseup dot net>
pkgname=kio-s3
pkgver=1.0.2
pkgrel=1
pkgdesc="KIO worker for Amazon S3 and compatible storage"
arch=('x86_64')
url="https://invent.kde.org/network/kio-s3"
license=('BSD-3-Clause' 'CC0-1.0' 'GPL-2.0-or-later')
depends=('kio' 'ki18n' 'aws-sdk-cpp' 'kirigami-addons')
makedepends=('extra-cmake-modules' 'cmake' 'kdoctools' 'kcmutils')
conflicts=('kio-s3-git')
source=("https://download.kde.org/stable/kio-s3/$pkgname-$pkgver.tar.xz")
sha256sums=('ce2c71ad99b553a89a0b265e1817b594ff688c3a9ddaa39a7a49046ba77211aa')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
