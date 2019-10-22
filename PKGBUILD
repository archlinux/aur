# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.34.1
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
md5sums=('ebe1afded21bc510a4752c3dc66fa21d')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

