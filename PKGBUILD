# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=python-yachalk
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc="${_name} python lib for terminal string styling done right"
url='https://github.com/bluenote10/yachalk'
depends=('python') 
makedepends=('python-build' 'python-installer')
checkdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/f4/96/a5a894fecc06ea48cac50e4d28f442a3d9bd9593655185ec79aed27b3dfb/yachalk-0.1.5.tar.gz")
sha256sums=('cac3b66a198a280f06adfde82f1604aecd9dd5ffc372a02b4f36d79ec499798a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
