# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.38.0
pkgrel=1
epoch=1
pkgdesc="Use i3 with GNOME Session integration."
arch=('any')
url="https://github.com/i3-gnome/i3-gnome/"
license=('MIT')
depends=(
	'i3-wm'
	'gnome-session'
	'gnome-settings-daemon'
)
optdepends=(
	'gdm'
	'gnome-flashback'
)
source=($pkgname-$pkgver.zip::https://github.com/i3-gnome/i3-gnome/archive/$pkgver.zip)
sha512sums=('436542ded3b7863c1bd24991d0d5a7eac7319e3b706d91aa92166ce27c22c2a366d205f1aad9e05441aa00eb42e24185a41caa8a4de9c32b59d92b78df277caa')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

