# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=slweb
pkgver=0.4.6
pkgrel=3
pkgdesc="Simple static website generator"
arch=('x86_64')
url="https://strahinja.srht.site/slweb"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/slweb/archive/v$pkgver.tar.gz")
md5sums=('ce6b9d97db9f454743d0a4fdaf235dea')

build() {
	local redo=$(command -v redo || echo ./do -c)
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ${redo}
}

package() {
	local redo=$(command -v redo || echo ./do)
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ${redo} install
}
