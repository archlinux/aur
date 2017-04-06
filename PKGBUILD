pkgname=anki
pkgver=2.0.45
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('AGPL3')
arch=('x86_64')
options=(!strip)
#depends=('python2-pyqt4' 'python2-beautifulsoup3' 'python2-httplib2' 'python2-sqlalchemy')
#optdepends=('mplayer: sound playing')
source=(https://apps.ankiweb.net/downloads/current/anki-$pkgver-amd64.tar.bz2 
Makefile)
sha512sums=('29ff160a3fe93e125e8d331626cec3e69adb0f6234af5a1dc74efbff35e6f4428b96b06b319a9961a8a63765aa085d40012279845f7633ad9c642532ad52b6a6'
            '1b87ae6eeddec7e21e70c82e060465927bf45fd75bf2f2e8fb274378de041f4399baa297886ac3904d44632f27c22633854032296dc3d6bf952c1be094c03d64')

prepare() {
  cp Makefile $srcdir/anki-$pkgver
}

package() {
  cd $srcdir/anki-$pkgver
  make DESTDIR=$pkgdir PREFIX=/usr install
}
