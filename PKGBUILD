# Maintainer: Christoph Brill <egore911@gmail.com>

pkgname=pylotro-git
pkgver=40
pkgrel=1
pkgdesc="LOTRO/DDO Launcher (needed to login to Turbine Inc. servers)"
arch=('i386' 'x86_64')
url="https://launchpad.net/~ajackson-bcs/+archive/ppa/"
license=('GPL3')
depends=('openal' 'python2-pyqt')
 if test "$CARCH" == x86_64; then
  depends+=('lib32-openal')
 fi
makedepends=('git')
conflicts=('pylotro')
provides=('pylotro')
source=('pylotro-git::git+https://github.com/nwestfal/pylotro.git')

package() {
  cd $srcdir/pylotro-git

  # Install files
  python2 setup.py install --root=$pkgdir
}

pkgver() {
  cd $srcdir/pylotro-git

  echo $(git rev-list --count master)
}

md5sums=('SKIP')
