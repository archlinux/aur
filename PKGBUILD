# Maintainer: David Campbell <davekong@archlinux.us>
pkgname=cparted
pkgver=0.1
pkgrel=2
pkgdesc="Curses based disk partition manipulation program"
arch=('any')
url="https://github.com/davekong/cparted"
license=('GPL')
install=cparted.install
depends=('python2' 'pyparted>=3.6')
conflicts=('cparted-git')
options=(!emptydirs)
source=("https://github.com/davekong/cparted/tarball/cparted-$pkgver")
md5sums=('407bddcbbe68b651e0434383afdb59cb')

package() {
  cd "$srcdir/davekong-cparted-5f4fe07"

  python2 setup.py build_scripts -e "/usr/bin/env python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
