# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=hheretic
pkgver=0.2.4
pkgrel=1
pkgdesc="A Linux port of Raven Game's old shooter, Heretic (aka Hacked Heretic)"
arch=('i686' 'x86_64')
url="http://hhexen.sourceforge.net/hheretic.html"
license=('GPL2')
depends=('sdl_mixer' 'glu')
optdepends=('timidity++: for midi music support'
            'heretic1-wad: data files from shareware version')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://downloads.sourceforge.net/hhexen/$pkgname-$pkgver.tar.gz")
sha256sums=('12572a41280953b606310647320471e132faefacb76f5645c8d6aab1b79cb2c1')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --with-audio=sdlmixer --with-datapath=/usr/share/games/heretic/
  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname-gl "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README "$pkgdir"/usr/share/docs/$pkgname/README
}
