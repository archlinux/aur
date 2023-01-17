# Contributor: Stefano Tortarolo <stefano@inventati.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=findimagedupes
pkgver=2.20.1
pkgrel=1
pkgdesc='Tool to find visually similar or duplicate images'
arch=('any')
url='http://www.jhnc.org/findimagedupes/'
license=('GPL3')
depends=('perl-file-mimeinfo' 'perl-inline-c' 'graphicsmagick')
makedepends=('perl' 'sed')
source=(http://www.jhnc.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8f2b0a2f7936d2db50d1d7fee22a76e2')
options=('zipman')

prepare() {
	sed -i -e "s:DIRECTORY => '/usr/local/lib/$pkgname':DIRECTORY => '/tmp':" $pkgname
}

build() {
	pod2man findimagedupes > findimagedupes.1
}

package() {
	install -D -m 755 findimagedupes $pkgdir/usr/bin/findimagedupes
	install -D -m 644 findimagedupes.1 $pkgdir/usr/share/man/man1/findimagedupes.1
}
