# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=crazydiskmark
pkgver=0.3.0
pkgrel=1
pkgdesc='Linux disk benchmark tool like CrystalDiskMark'
arch=('any')
url='https://github.com/fredcox/crazydiskmark'
license=('MIT')
depends=('python-pyqt5'
         'python-humanfriendly'
         'fio')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/5b/67/3e72f18f58b4cfe8b9facbf1445c0bfe82b901b435763b45842a3f602f8c/crazydiskmark-${pkgver}.tar.gz"
        'LICENSE::https://github.com/fredcox/crazydiskmark/raw/master/LICENSE')
sha256sums=('2c92804b6f5d4ff2e7c14772a168ca5099f97d5d5aadc00e229e29157b771dab'
            '6ad1a8e638684d561aa06d48bf6adc181f5893beb513460d9a664a1da43bd101')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
