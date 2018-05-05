# Maintainer: ghost <i at ghosts dot work>
pkgname=obs-gnome-screencast
pkgver=0.0.8
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
sha256sums=('3CD676E6A2A3DE065C7F903A16E64694BCC5408217CA707AEB7E0A72E5AC42C9')

build() {
  cd "$pkgname-$pkgver"
  meson --buildtype=release build 
  ninja -C build 
}

package() {
  sudo cp "$pkgname-$pkgver/build/gnome-screencast.so" /usr/lib/obs-plugins/
}