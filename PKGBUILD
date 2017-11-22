# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.1.2
pkgrel=1
pkgdesc=""
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus' 'libevent' 'curl' 'expat' 'openssl' 'ragel', 'meson', 'ninja')
depends=('dbus' 'libevent' 'curl' 'expat' 'openssl')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a280b96e576b3793bdc2f32509b182a7b0b5841737158f7145e210ee0302599a')
validpgpkeys=('A9A02AFEFF4B4D3CCC80F6168218F7122969D484')

build() {
	cd "$pkgname-$pkgver"
    mkdir _build
    cd _build
	meson ..
	ninja
}

package() {
	cd "$pkgname-$pkgver/_build"
	mkdir -p "$pkgdir"
	DESTDIR="$pkgdir" ninja install
}

