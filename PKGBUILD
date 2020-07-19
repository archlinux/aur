# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha
pkgver=0.2.8
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
conflicts=('gonha-git')
depends=('python-pyqt5'
         'python-humanfriendly'
         'python-ewmh'
         'python-pathlib'
         'python-configobj'
         'python-colr'
         'python-pyinquirer'
         'ttf-fira-code'
         'python-prompt_toolkit1014')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/65/86/0913ebb4671d39ce5228995a4235ea60d94786ff4fa5751e851e3fe9fdc9/gonha-${pkgver}.tar.gz"
        'LICENSE::https://github.com/fredcox/gonha/raw/master/LICENSE')
sha256sums=('5bddfc1e462ae2761c956b7eace40dee1d4e36aea2bc1e26b9e64d2d81fa39fb'
            '6ad1a8e638684d561aa06d48bf6adc181f5893beb513460d9a664a1da43bd101')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
  
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: