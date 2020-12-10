# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-labml
pkgver=0.4.65
pkgrel=1
pkgdesc="Monitor PyTorch & TensorFlow model training on mobile phones"
url="https://github.com/lab-ml/labml"
arch=('any')
provides=('python-labml')
depends=('python' 'python-gitpython' 'python-numpy' 'python-yaml')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5c2b830bd8808b0cc0ade380ecc04ae89ac4cb32342b79c2d40bbdc7d1ad3f4f')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
