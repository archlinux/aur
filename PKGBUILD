# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=waybar-asteroidz-workspaces
pkgver=1.0.0
pkgrel=1
pkgdesc='waybar CFFI plugin rendering asteroidz workspace tags as pills with real app icons'
arch=('x86_64')
url='https://github.com/asteroidzman/waybar-asteroidz-workspaces'
license=('MIT')
depends=('waybar' 'asteroidz' 'gtk3' 'glib2' 'json-glib')
makedepends=('pkgconf' 'git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr/lib/waybar DATADIR=/usr/share/waybar-asteroidz-workspaces install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
