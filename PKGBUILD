# Maintainer: agony <27015 at riseup dot net>
pkgname=kio-s3
pkgver=1.0.2
pkgrel=2
pkgdesc="KIO worker for Amazon S3 and compatible storage"
arch=('x86_64')
url="https://invent.kde.org/network/kio-s3"
license=('GPL-2.0-or-later AND CC0-1.0')
depends=('aws-sdk-cpp-core' 'aws-sdk-cpp-s3' 'glibc' 'kcmutils' 'kconfig' 'kcoreaddons' 'ki18n' 'kio'
         'kirigami' 'kirigami-addons' 'libstdc++' 'qt6-base' 'qt6-declarative')
makedepends=('extra-cmake-modules' 'cmake' 'kdoctools')
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
