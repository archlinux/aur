# Maintainer: Thayer Williams <thayer@archlinux.org>
# Contributor: Unknown

pkgname=trayer
pkgver=1.0
pkgrel=3
pkgdesc="Swallows GTK 1.2/2.x application docklets, and KDE docklets."
arch=('i686' 'x86_64')
url="https://gna.org/projects/fvwm-crystal/"
license=('GPL' 'custom')
depends=('gtk2' 'libxmu')
options=('!makeflags')
source=(http://download.gna.org/fvwm-crystal/trayer/$pkgver/$pkgname-$pkgver.tar.gz
        trayer.diff)
md5sums=('e1b0b6464f991f2c296561e377585867' '7f66eee885563871f9f76646bca6b14d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np0 -i ${startdir}/src/trayer.diff || return 1
  make || return 1
  make PREFIX=$startdir/pkg/usr install
}
