# Maintainer: Andy Botting <andy@andybotting.com>

_name=jsonpath-rw-ext
pkgname=python-$_name
pkgver=1.2.2
pkgrel=2
pkgdesc='Extensions for JSONPath RW'
arch=('any')
url="https://github.com/sileht/python-jsonpath-rw-ext"
license=('Apache')
depends=('python-jsonpath-rw')
makedepends=('python-setuptools')
checkdepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('28ca708023a942665c946d3e0ec618488f7d30d832e4ad0748d6c7019849f2ad19e3629c4452ab461b9c14d71f3360a4590357637f95ea44f8bc3b4544d5e0af')

export PBR_VERSION=$pkgver

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python setup.py test
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
