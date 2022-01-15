# Maintainer: Bart Louwers <sleeping@emeel.net>
pkgname=ut
pkgver=1.1.8
pkgrel=1
pkgdesc='UT: C++20 μ(micro)/Unit Testing Framework.'
arch=('any')
url='https://github.com/boost-ext/ut'
license=('Boost')
makedepends=('cmake')
source=("https://github.com/boost-ext/ut/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('eb8ae4db6b0d27b2a7d4621315db5c32')

build() {
    cd "$pkgname-$pkgver"
    cmake -DBOOST_UT_BUILD_BENCHMARKS=OFF -DBOOST_UT_BUILD_EXAMPLES=OFF -DBOOST_UT_BUILD_TESTS=OFF .
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
