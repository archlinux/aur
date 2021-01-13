# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="simple-salesforce"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="A basic Salesforce.com REST API client."
pkgver="1.10.1"
pkgrel=1
url="https://github.com/simple-salesforce/simple-salesforce"
license=('GPL3')
arch=('any')
depends=("python-requests" "python-authlib")
source=("https://github.com/simple-salesforce/simple-salesforce/archive/v${pkgver}.tar.gz")
sha256sums=('fdb211c569eb9d06b84bd024fe78e39200e1d4eb408e48025a331dfa591f2393')

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
