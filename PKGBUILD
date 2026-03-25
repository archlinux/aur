# Maintainer: agony <27015 at riseup dot net>
pkgname=kio-s3
pkgver=1.0.1
pkgrel=1
pkgdesc="KIO worker for Amazon S3 and compatible storage"
arch=('x86_64')
url="https://invent.kde.org/network/kio-s3"
license=('BSD-3-Clause' 'CC0-1.0' 'GPL-2.0-or-later')
depends=('kio' 'ki18n' 'aws-sdk-cpp' 'kirigami-addons')
makedepends=('extra-cmake-modules' 'cmake' 'kdoctools' 'kcmutils')
conflicts=('kio-s3-git')
source=("https://download.kde.org/stable/kio-s3/$pkgname-$pkgver.tar.xz")
sha256sums=('81b181fa61a687c319303bf05debe09176ef64320ff7577e968d0fd46aa6e6ee')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
