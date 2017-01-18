# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Marek Skrobacki <skrobul@skrobul.com>

pkgname=input-utils
pkgver=1.2
pkgrel=2
pkgdesc="Equivalent of Ubuntu/Debian's input-utils. Contains lsinput"
url="http://www.kraxel.org/releases/input/"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("http://www.kraxel.org/releases/input/input-$pkgver.tar.gz"
"fix1.patch"
"fix2.patch")
sha256sums=('7934244f34d5cd5d31a67d14892d4c0d8260dc0f622e01cf21bc1eddf4b98b56'
            'dd3a286493a3a792c2e09f6cb33bb27de416caede532ed091e46780e973659cf'
            '7d54421a081d6e52b3c1d570531a1558d235537691358df7dd251e33f2d31749')

build() {
  cd "$srcdir/input-$pkgver"
  patch -Np1 -i "$srcdir"/fix1.patch
  patch -Np1 -i "$srcdir"/fix2.patch
}

package() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
