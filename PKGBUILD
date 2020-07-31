# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gonha
pkgver=1.3.62
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
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
         'python-pathlib2'
         'python-requests'
         'python-netifaces'
         'python-numpy'
         'python-country_list'
         'python-unit-convert'
         'python-gputil')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'https://github.com/fredcox/gonha/raw/master/LICENSE')
sha256sums=('6441ce0aa3c182a67031e52244b925bd3e2448097afe58dd5a49f820ea894710'
            '6ad1a8e638684d561aa06d48bf6adc181f5893beb513460d9a664a1da43bd101')

#build() {
#  cd "${pkgname}-${pkgver}"
#  python setup.py build
#}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 #--skip-build
  install -Dm644 ${srcdir}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
