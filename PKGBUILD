# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="simple-salesforce"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="A basic Salesforce.com REST API client."
pkgver="1.11.4"
pkgrel=1
url="https://github.com/simple-salesforce/simple-salesforce"
license=('GPL3')
arch=('any')
depends=("python-requests" "python-authlib")
source=("https://github.com/simple-salesforce/simple-salesforce/archive/v${pkgver}.tar.gz")
sha256sums=('d7199139cfe1586c11eabbd6d0188874246dfdcce0c6b65601ac56f5c0f3ce4e')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package_python-simple-salesforce(){
  cd "$_name-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE.txt
}
# vim: ts=2 sw=2 et
