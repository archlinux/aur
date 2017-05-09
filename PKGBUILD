# Maintainer: Christoph Brill <egore911@gmail.com>

pkgname=pylotro-git
pkgver=62
pkgrel=1
pkgdesc="LOTRO/DDO Launcher (needed to login to Turbine Inc. servers)"
arch=('i686' 'x86_64')
url="https://github.com/nwestfal/pylotro"
license=('GPL3')
depends=('openal' 'python-pyqt4')
depends_x86_64=('lib32-openal')
makedepends=('git')
conflicts=('pylotro')
provides=('pylotro')
source=('pylotro-git::git+https://github.com/nwestfal/pylotro.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/pylotro-git

  echo $(git rev-list --count master)
}

package() {
  cd $srcdir/pylotro-git

  # Install files
  python setup.py install --root=$pkgdir
}
