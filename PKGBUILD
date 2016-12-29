# Contributor: Daniel Leidisch <spam@leidisch.net>
# Contributor: Jens Staal <staal1978@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname="heirloom-sh"
pkgver=050706
pkgrel=4
pkgdesc="A portable variant of the traditional Unix shell, derived from OpenSolaris code."
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/sh.html"
license=('BSD' 'CDDL')
conflicts=('heirloom-sh-cvs')
source=("http://sourceforge.net/projects/heirloom/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        '000-config.diff')
md5sums=('9169d9b3b845cb63c598ea29b8d2dfa0'
         '991b32bee780ce48685dfd4d39d41443')
sha1sums=('0ce709c21e09ef183986347cf1ed80d5884aa12d'
          '0119962358fce0b5ba88eab750d1ef2d91402428')
sha256sums=('25fb8409e1eb75bb5da21ca32baf2d5eebcb8b84a1288d66e65763a125809e1d'
            'f0452b9fb1c58a6f0fba6d49bcd7598f875c94f64ddd8b60bb8ab12bbbaf7c9b')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < ../000-config.diff
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install ROOT="$pkgdir"
  install -Dm644 CALDERA.LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/CALDERA
}

