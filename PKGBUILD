# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=python2-libvslvm
_pkgname=libvslvm
pkgver=20160110
pkgrel=1
pkgdesc="library to access the Linux Logical Volume Manager (LVM)"
arch=('any')
url="https://github.com/libyal/libvslvm"
license=('LGPL')
groups=()
depends=( 'python2')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/libyal/$_pkgname/releases/download/$pkgver/$_pkgname-experimental-$pkgver.tar.gz) 
md5sums=('03c3e53b5817e9e9ec2e0bc107ebc733')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
