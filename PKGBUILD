# Maintainer: ghost <i at ghosts dot work>
pkgname=obs-gnome-screencast
pkgver=0.0.9
pkgrel=1
pkgdesc="GNOME Screen Cast OBS Studio plugin, supports Wayland"
arch=('any')
url="https://github.com/fzwoch/$pkgname"
license=('GPL-2')
depends=('gnome-shell'
         'obs-studio')
makedepends=('meson')
optdepends=()
source=("https://github.com/fzwoch/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('E2599E30AD55E1FCB2ABED85DF29630045397FD532DEE8AA61F97CE05AFB5186')

build() {
  cd "$pkgname-$pkgver"
  meson --buildtype=release build 
  ninja -C build 
}

package() {
  sudo cp "$pkgname-$pkgver/build/gnome-screencast.so" /usr/lib/obs-plugins/
}