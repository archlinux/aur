# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=seturgent
_pkgver=1.5
pkgver=1.5.0
pkgrel=2
pkgdesc="Set an applications urgency hint (or not)"
arch=('i686' 'x86_64')
url="https://git.codemadness.org/seturgent/"
license=('MIT')
depends=('libx11')
makedepends=('gcc' 'make')
provides=('seturgent')
source=('https://codemadness.org/releases/seturgent/seturgent-1.5.tar.gz')
sha256sums=('2558a869a32ece97c8f19e322ff290e4c0234ff5e707a136f4c3351189c47019')

build() {
	cd "$srcdir/$pkgname-$_pkgver"
	make seturgent
}

package() {
	cd "$srcdir/$pkgname-$_pkgver"
	install -Dm755 seturgent "$pkgdir"/usr/bin/seturgent
}
