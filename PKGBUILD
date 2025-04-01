# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
pkgname=typhoon
pkgver=0.9.5
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'python' 'imagemagick')
makedepends=('git' 'meson' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0504d97a117e7cf8e3bd2e1e3302f1fd95863b715ede793ed79f169df242cbe0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}