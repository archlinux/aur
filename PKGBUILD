# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Max Bruckner (FSMaxB)
# Contributor: archtux <antonio dot arias99999 at gmail dot com>
pkgname=freac
pkgver=1.1.3
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org"
license=('GPL2')
depends=('faac' 'faad2' 'lame' 'libmp4v2' 'mpg123' 'libogg' 'opus' 'libpng'
         'speex' 'libvorbis' 'libpulse' 'libgudev' 'boca' 'hicolor-icon-theme')
provides=('freac.so=freac.so-64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enzo1982/freac/archive/v$pkgver.tar.gz")
sha256sums=('2e20ba1ceb07b17a3848c922b3356416099482a3ea2a6c20124e91c89f4f87ed')

prepare() {
	cd "$pkgname-$pkgver"
	find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
