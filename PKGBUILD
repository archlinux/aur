# Maintainer: Techmeology <techmeology@techmeology.co.uk>
pkgname=torchat2-libpurple-git
pkgver=480.aab4643
pkgrel=1
pkgdesc="Libpurple plugin for Torchat v2 - an IM client built on top of TOR"
arch=('any')
url="https://github.com/prof7bit/TorChat"
license=('unknown')
depends=('libpurple')
makedepends=('fpc' 'git')
source=(git+https://github.com/prof7bit/TorChat.git)
md5sums=('SKIP')

pkgver() {
	cd "TorChat"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/TorChat"
	make purple
}

package() {
	cd "$srcdir/TorChat"
	make PREFIX="$pkgdir/usr/" installpurple
}
