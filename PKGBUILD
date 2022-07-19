# Maintainer: Roshless <aur@roshless.com>
pkgname=spek-alternative
pkgver=0.8.2.3
pkgrel=5
pkgdesc='An acoustic spectrum analyser. Fork'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/withmorten/spek-alternative'
license=('GPL3')
depends=('desktop-file-utils' 'ffmpeg' 'ffmpeg4.4' 'wxgtk3')
provides=('spek')
conflicts=('spek' 'spek-git')
makedepends=('intltool')
source=("https://github.com/withmorten/spek-alternative/archive/$pkgver.tar.gz")
md5sums=('e7b7ce256e1712b6d22ddbf5892013a5')

build()
{
	cd "$pkgname-$pkgver"
	export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

