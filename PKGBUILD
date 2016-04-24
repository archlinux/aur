# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=git-buildpackage
pkgver=0.7.3
pkgrel=1
pkgdesc="Tools from Debian to integrate the package build system with Git"
arch=(any)
url="https://honk.sigxcpu.org/piki/projects/git-buildpackage/"
license=('GPL')
depends=('git'
         'man-db'
         'python2'
         'python2-dateutil'
         'rpm-org')
makedepends=('python2-distribute')
backup=('etc/git-buildpackage/gbp.conf')
source=("git://honk.sigxcpu.org/git/git-buildpackage.git#tag=debian/$pkgver")
sha256sums=('SKIP')

build() {
  cd git-buildpackage/
  export WITHOUT_NOSETESTS=1
  python2 setup.py build
}

package() {
  cd git-buildpackage/
  export WITHOUT_NOSETESTS=1
  python2 setup.py install --root="$pkgdir" --prefix=/usr -O1
}
