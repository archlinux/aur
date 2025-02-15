# Maintainer: VDawg @ vdawg  tuta  io
pkgname=moo
pkgver=0.0.2
pkgrel=3
pkgdesc="Sick terminal music player with smart playlists."
arch=('x86_64' 'aarch64')
url="https://github.com/vdawg-git/moo/"
license=('MIT')
depends=('mpv')
makedepends=('bun')
provides=()
options=()
conflicts=()
replaces=()
source=("$pkgname-v$pkgver.tar.gz::https://github.com/vdawg-git/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP') 

build() {
	cd "src/$pkgname-$pkgver"
	bun install
	bun compile
}

package() {
    cd "src/$pkgname-$pkgver"
    install -Dm755 ./dist/moo "$pkgdir/usr/bin/moo"
}
