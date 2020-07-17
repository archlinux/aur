# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha
pkgver=0.1.34
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
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fc/c6/152c6b3c9226255f1eccb6ae18b4d4ee5b1ff782c2884ceb07292150ec5b/gonha-${pkgver}.tar.gz"
        'LICENSE::https://github.com/fredcox/gonha/raw/master/LICENSE')
sha256sums=('1edb579ee86fd8a8b5a5005ce6cfa9931258ff1c91272e6b673d1fb7016bb2d6'
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