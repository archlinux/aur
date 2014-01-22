# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=hhexen
pkgver=1.6.3
pkgrel=1
pkgdesc="A Linux port of Raven Game's old shooter, Hexen (aka Hacked Hexen)"
arch=('i686' 'x86_64')
url="http://hhexen.sourceforge.net/hhexen.html"
license=('GPL2')
depends=('sdl_mixer' 'glu')
optdepends=('timidity++: for midi music support'
            'hexen1-wad: data files from shareware version')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tgz")
sha256sums=('ab88c1df8b2be107beb0fc1f7d6193c0102f731032955bacccc0b6c515668ccb')

build() {
  cd $pkgname-$pkgver-src

  ./configure --prefix=/usr --with-audio=sdlmixer
  make
}

package() {
  cd $pkgname-$pkgver-src

  install -Dm755 $pkgname-gl "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README-1.6 "$pkgdir"/usr/share/docs/$pkgname/README
}
