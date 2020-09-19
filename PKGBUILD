# Maintainer: Jannik Birk <birk dot jannik at gmail dot com>

pkgname=python-pyulog
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="Python module & scripts for ULog files"
arch=("any")
url="https://github.com/px4/pyulog"
license=("BSD")
depends=("python")
optdepends=('python-simplekml')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("85d8c7bf6aa34bde6aea82f90ebc7ff698d10206321be0d26c38eb9ca2837bc7")

build() {
  cd "pyulog-$pkgver"
  python setup.py build
}

package() {
  cd "pyulog-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -D -m644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
