# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=python2-alchemical-analysis-git
pkgver=r42.08d5012
pkgrel=1
pkgdesc="An open tool implementing some recommended practices for analyzing alchemical free energy calculations"
arch=('i686' 'x86_64')
url="https://github.com/MobleyLab/alchemical-analysis"
license=('LGPL')
depends=('python2')
makedepends=('git')
source=('git://github.com/MobleyLab/alchemical-analysis.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/alchemical-analysis"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/alchemical-analysis"
    python2 setup.py install --root=$pkgdir || return 1
}
