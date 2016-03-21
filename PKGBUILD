#Maintainer: Nathan Isom nathanisom27[AT]gmail[DOT]com

pkgname=ttf-font-linux
pkgver=v0.5
pkgrel=1
pkgdesc="tty release of the font-linux font"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("git://github.com/Lukas-W/font-linux/")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd $srcdir/font-linux
  git describe --long --tags | sed -r 's/-([0-9,a-g,A-G]{1}.*)//'
}

package() {
  cd $srcdir/font-linux
  git checkout $pkgver
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/font-linux/assets/font-linux.ttf" "$pkgdir/usr/share/fonts/TTF/"
}

