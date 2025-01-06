# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=hhexen
pkgver=1.6.4
pkgrel=1
pkgdesc="A Linux port of Raven Game's old shooter, Hexen (aka Hacked Hexen)"
arch=('any')
url="http://hhexen.sourceforge.net/hhexen.html"
license=('GPL2')
depends=('sdl_mixer' 'glu')
optdepends=('timidity++: for midi music support'
            'hexen1-wad: data files from shareware version')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8a5d8feac4a9db457e8d4474ee0bf038f46494e805a2585a90ccf74374029c69')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --with-audio=sdlmixer --with-datapath=/usr/share/games/hexen/
  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname-gl "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README "$pkgdir"/usr/share/docs/$pkgname/README
}
