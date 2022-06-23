# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
_name=labml_db
pkgname=python-labml-db
pkgver=0.0.15
pkgrel=1
pkgdesc="Minimalistic Object-Relational Mapper for JSON/YAML/Pickle file based db"
url="https://github.com/labmlai/db"
arch=('any')
provides=('python-labml-db')
depends=('python-redis' 'python-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('89d3a1e26a7171cc21a05b0c97830b91644b63215692312099aa849e89e3a1b9')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
