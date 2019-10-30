# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=gxi
pkgver=0.8.1
pkgrel=1
pkgdesc="GTK frontend, written in Rust, for the xi editor."
arch=("x86_64")
url="https://github.com/Cogitri/gxi/"
license=('MIT')
makedepends=('meson')
depends=('gtk3' 'rust')
source=("https://github.com/Cogitri/gxi/releases/download/v$pkgver/gxi-$pkgver.tar.xz")

build() {
  cd $pkgname-$pkgver
  meson build --prefix /usr/
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('7f970239815cd688218c360fba7f00b8e1eb9ee9bafc9ce578e61018cca087a1')
