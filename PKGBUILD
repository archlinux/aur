# Maintainer: João Figueiredo <jf dot mundox at gmail dot com> (28/05/2020)
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: nic96
pkgname=fracplanet
pkgver=0.5.1
pkgrel=4
pkgdesc="Fractal planet and terrain generator"
url="http://sourceforge.net/projects/fracplanet/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt4' 'glu')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/fracplanet/fracplanet/$pkgver/fracplanet-$pkgver.tar.gz"
        "fracplanet.png"
        "fracplanet.desktop")
sha256sums=('435dd07e1798f810280260d09d2ee85e870eb466411e49b859eb1bef6f336ade'
            '872c4c33c1db66b6ec606ab753cc02a7459d3f0188427d12d6374103d4ecef6f'
            'a4b58ebcd5110b6ff99720aa166db0e3ca7e530f744659e1784cb3f349584ff0')

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake-qt4 "VERSION_NUMBER=$VERSION_NUMBER" fracplanet.pro
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 $srcdir/$pkgname-$pkgver/fracplanet $pkgdir/usr/bin/fracplanet
  install -Dm644 $srcdir/fracplanet.desktop $pkgdir/usr/share/applications/fracplanet.desktop
  install -Dm644 $srcdir/fracplanet.png $pkgdir/usr/share/pixmaps/fracplanet.png
}
