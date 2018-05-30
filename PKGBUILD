# Maintainer: Roshless <aur@roshless.com>
pkgname=spek-alternative
pkgver=0.8.2.3
pkgrel=1
pkgdesc='An acoustic spectrum analyser. Fork'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/withmorten/spek-alternative'
license=('GPL3')
depends=('desktop-file-utils' 'ffmpeg' 'wxgtk')
provides=('spek')
conflicts=('spek' 'spek-git')
makedepends=('intltool')
source=("https://github.com/withmorten/spek-alternative/archive/$pkgver.tar.gz")
md5sums=('e7b7ce256e1712b6d22ddbf5892013a5')

build()
{
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

