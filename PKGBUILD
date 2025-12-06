# Maintainer: Dacraezy1 <younesaouzal18@gmail.com>
pkgname=pkg-sync
pkgver=1.0.0
pkgrel=1
pkgdesc="An interactive system health manager for Arch Linux"
arch=('x86_64')
url="https://github.com/Dacraezy1/pkg-sync"
license=('MIT')
depends=('pacman' 'pacman-contrib' 'curl')
optdepends=('yay: for AUR updates' 'paru: alternative AUR helper')
source=("https://github.com/Dacraezy1/pkg-sync/archive/v$pkgver.tar.gz")
sha256sums=('b371490750be1953186d9df419b29e7163319664776994ce9477d760efd71a7a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
