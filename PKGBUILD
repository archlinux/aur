# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=hheretic
pkgver=0.2.3
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
source=("http://downloads.sourceforge.net/hhexen/$pkgname-$pkgver-src.tgz")
sha256sums=('ad69fbdbae75cd673b140a0f1058fd1835ce26d5859ede9e8477d5c44ec35733')

build() {
  cd $pkgname-$pkgver-src

  ./configure --prefix=/usr --with-audio=sdlmixer
  make
}

package() {
  cd $pkgname-$pkgver-src

  install -Dm755 $pkgname-gl "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README "$pkgdir"/usr/share/docs/$pkgname/README
}
