# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=rofi-jack-git
pkgver=r37.f47a3b1
pkgrel=2
pkgdesc='Scripts for controlling jack using rofi'
arch=('any')
url='https://github.com/madskjeldgaard/rofi-jack'
license=('GPL')
groups=('pro-audio')
depends=('rofi')
makedepends=('git')
optdepends=('jack2' 'jack')
source=("$pkgname"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 $srcdir/$pkgname/rofi-jack-connect $pkgdir/usr/bin/rofi-jack-connect
	install -Dm755 $srcdir/$pkgname/rofi-jack-device $pkgdir/usr/bin/rofi-jack-device
}
