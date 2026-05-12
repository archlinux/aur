pkgname=obs-dvd-screensaver
pkgver=0.1.0
pkgrel=1
pkgdesc="A plugin for OBS Studio that adds a DVD style screen saver source 📀Will it hit the corner?"
arch=('x86_64')
url="https://github.com/wimpysworld/obs-dvd-screensaver"
license=('GPL-2.0-or-later')
depends=('obs-studio' 'glibc')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('de7c835b1ebf3ec76209ff758184d39bb3bcfbc5e03c969f6b9bc1a4a50a6474')

build() {
  cmake -B build -S "$pkgname-$pkgver" -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
