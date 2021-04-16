# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Steffen Weber <-boenki-gmx-de->

_pkgname=otter-browser
pkgname=otter-browser-webengine
pkgver=1.0.02
pkgrel=1
pkgdesc='Web browser aiming to recreate the best aspects of the classic Opera (12.x) UI using Qt5. (Built with the experimental WebEngine backend instead of WebKit.)'
arch=('x86_64')
url='https://otter-browser.org/'
license=('GPL3')
depends=('hunspell' 'qt5-multimedia' 'qt5-svg' 'qt5-webengine' 'qt5-xmlpatterns')
makedepends=('cmake' 'ninja')
replaces=('otter-browser-nowebengine')
source=("https://github.com/OtterBrowser/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('d1e090a80fa736cd128f594184817078a08cac31614e85e7838ff1b64511d62d')

build() {
  cmake -S $_pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
