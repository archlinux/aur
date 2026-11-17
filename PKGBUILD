# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-scfg
pkgver=0.25.2
pkgrel=1
pkgdesc='scfg implementation for Hare'
arch=('any')
url='https://git.sr.ht/~chrisppy/hare-scfg'
license=('MPL-2.0')
depends=('hare')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~chrisppy/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('9d34586e98ce7388e05416c554a4194bf02009b7679953e1cf96c94b8732361263de7ef5c506adb7afd6c39c9bcfd467b856f13cbb1f9ea81b54e0885a09574f')

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
