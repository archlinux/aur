# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: snuo

pkgname=vinetto
pkgver=0.07beta
pkgrel=6
pkgdesc="a forensics tool to examine Thumbs.db files"
url="http://vinetto.sourceforge.net"
license="GPL-2"
arch=('i686' 'x86_64')
depends=('python2' 'python2-pillow')
source=("vinetto-hashlib.patch"
	"http://downloads.sourceforge.net/$pkgname/$pkgname-beta-0.07.tar.gz")
md5sums=('dad52b1380f3a4e04ceac2e981237361'
         '3bfab4eaacde52a66a6829dddc7511cc')
sha1sums=('01f70e032c17d3a90cd17244432a731ba01d3726'
          '5f53a4ce6985a7d6a387c09d79038124d88b796e')

package() {
  cd $srcdir/$pkgname-beta-0.07
  patch -i ../vinetto-hashlib.patch $srcdir/$pkgname-beta-0.07/vinetto
  python2 setup.py install --root=$pkgdir/ --prefix=/usr
}
