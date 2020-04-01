# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=3.36.0
pkgrel=2
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
sha512sums=('aed6340aa3d90055f4401c1507c0db516e87791b3e4a5934d910189c293c8603a0f9d0771aa55aa2c5e16de70149d2cb6cb29d0d6f02fd73df3ac9fc8c9f0881')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

