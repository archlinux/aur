# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=ice
pkgver=6.0.8.r30.g5ddfc8e
_commit=5ddfc8e9c5eca3c575d6c1a300420f76106d22a1
pkgrel=1
pkgdesc="Tool to create Chromium/Chrome/Firefox/Vivaldi SSBs in Peppermint OS."
arch=('any')
url="https://github.com/PizzaLovingNerd/ice"
license=('GPL')
depends=('python-gobject' 'python-requests' 'python-beautifulsoup4')
conflicts=("$pkgname-ssb" "$pkgname-dev")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('a19706a04d1dedc6cbae444dd47085a9419aa5aa1cc28a4680c38a9bfa0422c6')

prepare() {
	cd "$pkgname-$_commit"
	sed -i \
		-e 's/brave-browser/brave/g' \
		-e 's/google-chrome/google-chrome-stable/g' \
		-e 's/chromium-browser/chromium/g' \
		"usr/bin/$pkgname"
}

package() {
	cd "$pkgname-$_commit"
	cp -av --no-preserve=ownership usr "$pkgdir"
}
