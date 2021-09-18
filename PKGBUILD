# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=40.4
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
sha512sums=('21e97de791bd99e971ed6837f4e3349a02add98cfe6c6d392adf22d1bab17ade783bbc0833ee77cafcf27460e33a14c0305b0b442b20a2ea1c03425e4c15b867')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

