# Maintainer: Austin Haedicke <gtbb on irc #archlinux>

_pkgname=phoronix-test-suite
pkgname=phoronix-test-suite-git
pkgver=v5.8.1.1.ge6fbee9
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.phoronix-test-suite.com/"
depends=('desktop-file-utils' 'hicolor-icon-theme' 'python' 'ruby')
makedepends=('git')
optdepends=('php' 'php-gtk' 'php-curl' 'php-gd')
source=("https://github.com/phoronix-test-suite/phoronix-test-suite.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g'
}

package() {
  cd $srcdir/$_pkgname
  mkdir -p $pkgdir/usr/bin
  ./install-sh ${pkgdir}/usr
#  xdg-icon-resource forceupdate
}
