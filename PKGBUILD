# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-colorful
_name=${pkgname#python-}
pkgver=0.5.5
pkgrel=2
pkgdesc="Terminal string styling done right, in Python"
arch=('any')
url="https://github.com/timofurrer/colorful"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer'
'python-wheel' 'python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('66f8c1264b2a26f7293b96a03bb7a76c4bc8b9634369a0bffdcd12d618056a1d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
