# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-labml-dashboard
pkgver=0.4.87
pkgrel=2
pkgdesc="Dashboard for Lab: Organize Machine Learning Experiments"
url="https://github.com/lab-ml/dashboard"
arch=('any')
provides=('python-labml-dashboard')
depends=('python' 'python-gitpython' 'python-numpy' 'python-yaml')
makedepends=('python-setuptools')
_name_suffix="${pkgname#python-}"
_name="${_name_suffix//-/_}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('616d782aa958902223d949b36585d154b1b1ae9d550ba9256c3f0dd58aab3abf')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
