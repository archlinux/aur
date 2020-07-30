# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha
pkgver=1.3.0
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
         'python-py-cpuinfo'
         'ttf-fira-code'
         'python-pathlib'
         'python-requests'
         'python-netifaces'
         'python-numpy'
         'python-country-list'
         'python-unit-convert')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/f3/6f/2c715586f1c5e5fc8dc61b7a277df30a58c17f57ceda0fe18fbdce59ab60/gonha-1.3.0.tar.gz"
        'LICENSE::https://github.com/fredcox/gonha/raw/master/LICENSE')
sha256sums=('77bfd2bf5cd6b75e78be4d4acc8383f685bd8e0ddd13c5f5184bfb2661f724f1'
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