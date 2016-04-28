# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
pkgname=spek
pkgver=0.8.3
pkgrel=5
pkgdesc='An acoustic spectrum analyser.'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='http://spek.cc/'
license=('GPL3')
depends=('desktop-file-utils' 'ffmpeg2.8' 'wxgtk')
makedepends=('intltool')
source=("https://github.com/alexkay/spek/archive/v$pkgver.tar.gz")
sha512sums=('a4b54746316d295574bc963e650728b23b3730ee6bcc8d78b043a5678baac70a0e859870120de2b0e6a17059e9e3757075f4691e2abde98c083afc393e93e17c')

build()
{
	cd "spek-$pkgver"
	export PKG_CONFIG_PATH='/usr/lib/ffmpeg2.8/pkgconfig'
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
