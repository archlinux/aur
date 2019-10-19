# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
pkgname=amide  
pkgver=1.0.6
pkgrel=1
pkgdesc='Medical imaging data examiner'
arch=('x86_64')
url='http://amide.sourceforge.net/'
license=('GPL')
depends=('dcmtk' 'ffmpeg' 'gnome-vfs' 'gsl' 'libgnomecanvas' 'volpack' 'xmedcon')
makedepends=('gnome-doc-utils' 'intltool')
source=('https://web.stanford.edu/~loening/files/amide-1.0.6-2.fc25.src.rpm')
sha512sums=('2d6f9d7cfa7921ba95fd0a887504d4ec135d0e93d94ffdf256b5fc94f3df1766006e0f13ca24c1cc7904c636182db96b7e7c29ac2529554c351458217406053d')

prepare() {
	bsdtar --extract --file "$pkgname-$pkgver.tgz"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make --jobs=1
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
