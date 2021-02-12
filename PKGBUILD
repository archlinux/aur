# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-labml
pkgver=0.4.102
pkgrel=2
pkgdesc="Monitor PyTorch & TensorFlow model training on mobile phones"
url="https://github.com/lab-ml/labml"
arch=('any')
provides=('python-labml')
depends=('python' 'python-gitpython' 'python-numpy' 'python-yaml')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/lab-ml/labml/d985590982103204baf5ae72cd19078c118e14ba/readme.md")
sha256sums=('731491bdfd247bb68b2d432a0774e1cad92748122be94f2123ad48732a711ad0'
            'eaaa2f650a237b5b68cc191fda014b55a04ced341387b86e7666acf3d989b996')

build() {
  cd "$srcdir/$_name-$pkgver"
  cp ../readme.md .
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
