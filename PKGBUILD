# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=rofi-jack-git
pkgver=r37.f47a3b1
pkgrel=1
pkgdesc='Scripts for controlling jack using rofi'
arch=('any')
url='https://github.com/madskjeldgaard/rofi-jack'
license=('GPL')
groups=('pro-audio')
depends=('rofi')
makedepends=('git')
optdepends=('jack2' 'jack')
source=("$pkgname-$pkgver"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 $srcdir/$pkgname-$pkgver/rofi-jack-connect $pkgdir/usr/bin/rofi-jack-connect
	install -Dm755 $srcdir/$pkgname-$pkgver/rofi-jack-device $pkgdir/usr/bin/rofi-jack-device
}

