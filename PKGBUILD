# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname='python-preprocess-cancellation'
_name=${pkgname#python-}
_name_source=${_name/-/_}
pkgver=0.2.0
pkgrel=1
pkgdesc="GCode processor to add klipper cancel-object markers"
arch=(any)
url="https://github.com/kageurufu/cancelobject-preprocessor"
license=('GPL3')
makedepends=('python-setuptools')
optdepends=('python-shapely')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name_source-$pkgver.tar.gz")
sha256sums=('eb68494e35c0a1fe83716f2a14e12b3e1cdedf9458752be1cace00f944d90760')

build() {
  cd "${srcdir}/${_name_source}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name_source}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
