# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=liquidwar6
pkgver=0.2.3551
pkgrel=1
pkgdesc="Your army is a blob of liquid and you have to try and eat your opponents. Complete rewrite of Liquidwar 5.x"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/liquidwar6/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'gtk2' 'sqlite3' 'guile' 'glu' 'curl')
optdepends=("liquidwar6-extra-maps: contributed extra maps")
install=$pkgname.install
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7f0dc9cba9fff4c2a2896108bda97fd055edef51e48779d2bb1fc268361692d9')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname \
              --disable-mod-csound --disable-mod-caca --enable-allinone

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
