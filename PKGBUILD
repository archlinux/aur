# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-thermalmonitor
pkgver=0.2.8
pkgrel=1
pkgdesc="A KDE Plasmoid for displaying system temperatures."
arch=('any')
url='https://invent.kde.org/olib/thermalmonitor'
license=("MIT")
depends=('plasma-workspace' 'ksystemstats' 'libksysguard' 'kitemmodels' 'kdeclarative' 'kquickcharts')
makedepends=('cmake' 'extra-cmake-modules')
source=("$url/-/archive/v$pkgver/thermalmonitor-v$pkgver.tar.gz")
sha256sums=('1246a1d689fc8a862fe07e292476a8fe51ea9f8d0fef35e13852850877c4df02')

build() {
  cd thermalmonitor-v$pkgver
  cmake -S . -B build
  cmake --build build
}

package() {
  cd thermalmonitor-v$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE.txt
}
