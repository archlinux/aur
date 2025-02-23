# Maintainer: Mihai David <mihai.david556@gmail.com>
pkgname=clipcell
pkgver=1.0.0
pkgrel=1
url="https://github.com/divadiahim/clipcell"
pkgdesc="A wayland native GUI clipboard manager"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots' 'wl-clipboard' 'freetype2' 'tllist')
makedepends=('make' 'wayland-protocols')
source=("https://github.com/divadiahim/clipcell/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/divadiahim/clipcell/releases/download/v$pkgver/config.h")
sha256sums=('dbdc14e4bbc69b61ffc2285a6cfb070c4bc17cacd63242c0af33b6256e88e660'
            'c73dcfbe921e5d58344e5b7074e17c477a5cca85b77b7f237141ff0bc4b77283')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	if [ -s "$srcdir/config.h" ]; then
		cp -f "$srcdir/config.h" src/config.h
	fi
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make $MAKEOPTS
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -Dm 0755 bin/clipcell bin/clipcelld -t "$pkgdir/usr/bin/"
}

sha256sums=('dbdc14e4bbc69b61ffc2285a6cfb070c4bc17cacd63242c0af33b6256e88e660'
            'c73dcfbe921e5d58344e5b7074e17c477a5cca85b77b7f237141ff0bc4b77283')
