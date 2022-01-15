# Maintainer: Robert Baldwin <robert.baldwin@protonmail.com>

_name=marshmallow-oneofschema
pkgname=python-$_name
pkgver=3.0.1
pkgrel=1
pkgdesc='Schema (de)multiplexing for marshmallow'
arch=('any')
url='https://github.com/marshmallow-code/marshmallow-oneofschema'
license=('MIT')
depends=('python' 'python-marshmallow')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/$_name-$pkgver.tar.gz")
sha256sums=('62cd2099b29188c92493c2940ee79d1bf2f2619a71721664e5a98ec2faa58237')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
