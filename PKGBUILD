# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Anselmo L. S. Melo <anselmo.melo@intel.com>

_pypiname=defcon
pkgname=python-$_pypiname-git
pkgver=0.6.0.r63.g71f1cd9
epoch=1
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications'
arch=('any')
url="https://github.com/robotools/$_pypiname"
license=('MIT')
makedepends=('git' 'python-setuptools')
source=("git://github.com/robotools/$_pypiname.git")
sha256sums=('SKIP')

package() {
  cd "$_pypiname"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$_pypiname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
