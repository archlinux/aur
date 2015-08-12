# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
pkgname=spek
pkgver=0.8.3
pkgrel=2
pkgdesc='An acoustic spectrum analyser.'
arch=('any')
url='http://spek.cc/'
license=('GPL3')
depends=('desktop-file-utils' 'ffmpeg' 'wxgtk')
makedepends=('intltool')
install=install
source=("https://github.com/alexkay/spek/archive/v$pkgver.tar.gz")
sha512sums=('a4b54746316d295574bc963e650728b23b3730ee6bcc8d78b043a5678baac70a0e859870120de2b0e6a17059e9e3757075f4691e2abde98c083afc393e93e17c')

build()
{
	cd "spek-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
