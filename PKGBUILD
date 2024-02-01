# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname='python-preprocess-cancellation'
_name=${pkgname#python-}
_name_source=${_name/-/_}
pkgver=0.2.1
pkgrel=1
pkgdesc="GCode processor to add klipper cancel-object markers"
arch=(any)
url="https://github.com/kageurufu/cancelobject-preprocessor"
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-shapely')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name_source-$pkgver.tar.gz")
sha256sums=('e2f1224e1ba1603bdfdbf6937caaf91082dc849e5122e80a5328aa999433ce79')

build() {
  cd "${srcdir}/${_name_source}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name_source}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
