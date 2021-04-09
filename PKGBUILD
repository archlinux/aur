# Maintainer: Jesús Castro <x51v4n@gmail.com>

pkgname=i3-gnome
pkgver=40
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
sha512sums=('54cf1e0f3ca2f9966d81caa183e9cc2abf7717f5a4aa6e191e8d3c37c84f26e8048e6e7caf02c45637e6c8679ac230c7be87c3bfff89a3fd6cb1fb8a4f913e91')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

