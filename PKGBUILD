# Maintainer: mia <mia@mia.jetzt>

pkgname=obs-source-profiler
pkgver=0.0.9
pkgrel=1
pkgdesc="Source profiling plugin for OBS"
arch=('x86_64')
url="https://github.com/exeldro/obs-source-profiler"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e2d99cd0032ea50f68b798b42c003147baba393a299cb885ac5f1b1051c43d33')

build() {
    cmake -S "$pkgbase-$pkgver" -B build -DBUILD_OUT_OF_TREE=On -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
    cmake --build build
}

package() {
    cmake --install build
}
