# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgname=python-gsm0338
_pyname=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc='Python codec for GSM 03.38'
arch=('any')
url='https://github.com/dsch/gsm0338'
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/dsch/gsm0338/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('50abd5a9cb93caefab49bdd104a8bb2fd8097edf225df9dc759865d6fd3b43328a3ed57f0905e07cb86b437a9ce527ce0a877735991674dcca33c30a65814775')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
