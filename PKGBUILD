# Contributor: kreed <kreed@kreed.org>
# Contributor: rayman2200
pkgname=mcrcon
pkgver=0.0.5
pkgrel=1
pkgdesc="Console based remote console (rcon) client for Minecraft servers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mcrcon/"
license=('ZLIB')
source=(http://sourceforge.net/projects/mcrcon/files/${pkgver}/mcrcon-${pkgver}-src.zip)
noextract=('mcrcon-0.0.5-src.zip')
makedepends=('unzip')

prepare() {
  unzip -qo "$srcdir/mcrcon-${pkgver}-src.zip"
}

build() {
  echo gcc -std=gnu99 $CFLAGS -o mcrcon mcrcon.c
  gcc -std=gnu99 $CFLAGS -o mcrcon mcrcon.c
}

package() {
  install -m 755 -D mcrcon "$pkgdir/usr/bin/mcrcon"
  install -m 644 -D LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

md5sums=('162643de87103b0bd2a58529f123fc79')
