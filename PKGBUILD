# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Pochang Chen <johnchen902@gmail.com>

pkgname=python-nclib
_name=nclib
pkgver=1.0.1
pkgrel=1
pkgdesc="Netcat as a library: convienent socket interfaces"
license=('MIT')
arch=('any')
url="https://pypi.python.org/pypi/nclib"
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/rhelmot/nclib/release/stable/LICENSE")
sha512sums=('bafa3a1aa9c83c7a1cd0d32485c4a16bfaa7d0ff720dacfef60c720353bd393ee33ffe959341488b82d9bcebf09e2e7d0873e586cea78104b69f49a0029ccbf5'
            'caafbd65a0d0088eef0980ec3b72d7e6a001986d3dbd329a8c1c0ffe2ebcf212ce6be0cf7c19aff88389c9bc16022e4ec6f073cf79e24bcfd88bb126104e6af9')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
