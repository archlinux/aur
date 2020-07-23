# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha
pkgver=0.2.16
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
conflicts=('gonha-git')
depends=('python-pyqt5'
         'python-ewmh'
         'python-psutil'
         'python-humanfriendly'
         'python-pyinquirer'
         'python-colr'
         'python-distro'
         'python-prompt_toolkit1014'
         'ttf-fira-code')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/f6/18/517d87fa17048795c30e90b0d5ad80b1f3a75c50e709cbe2e8b3bfb78fdf/gonha-0.2.16.tar.gz"
        'LICENSE::https://github.com/fredcox/gonha/raw/master/LICENSE')
sha256sums=('53e0a4a2ca87bcc25bea31c140996f4e576746ce4bf23d3ed6a2cf9ea4a4345d'
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