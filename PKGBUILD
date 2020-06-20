# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Max Bruckner (FSMaxB)
# Contributor: archtux <antonio dot arias99999 at gmail dot com>
pkgname=freac
pkgver=1.1.2
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('i686' 'x86_64')
url="https://www.freac.org"
license=('GPL2')
depends=('faac' 'faad2' 'libjpeg-turbo' 'lame' 'libmp4v2' 'mpg123' 'libogg' 'opus' 'libpng'
         'speex' 'libvorbis' 'libpulse' 'libgudev' 'boca' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enzo1982/freac/archive/v$pkgver.tar.gz")
sha256sums=('d275d15969429034f1589930ee052b3bdf2baacdccfee9a7ad24aa25206955df')

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
