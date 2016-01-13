# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot-bzr
pkgver=2.0.r521
pkgrel=1
epoch=1
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
conflicts=(openshot)
depends=('python' 'python-pyqt5' 'desktop-file-utils' 'shared-mime-info')
makedepends=('bzr')
install=openshot.install
source=(bzr+lp:openshot/2.0)
md5sums=('SKIP')

pkgver() {
    cd $srcdir/2.0
    printf "2.0.r%s" "$(bzr revno)"
}

package() {
  cd $srcdir/2.0
  python setup.py install --root=$pkgdir/ --optimize=1
}
