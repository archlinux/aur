# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=unicc
pkgver=1.6.0
pkgrel=1
epoch=
pkgdesc="Universal LALR(1) parser generator for C, C++, Python, JavaScript, JSON and XML"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://phorward.info"
license=('BSD')
depends=('phorward>=0.24.0')
makedepends=()
checkdepends=()
#changelog=CHANGELOG
source=("https://phorward.info/download/unicc/$pkgname-$pkgver.tar.gz"
"https://phorward.info/download/unicc/unicc.pdf")
sha256sums=('5d8bdca5f1f7524211c7d2b82f0063dbe575233c779f5e3aae7a5f79c339183c'
'772ff233aae1eb433778534785556a7cb0e20a071c601a57631bc7ae8b1432df')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	cd ..
	cp unicc.pdf $pkgdir/usr/share/unicc
}

