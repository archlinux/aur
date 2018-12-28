# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.11.1
pkgrel=1
pkgdesc='Python 3 library for communicating with the TREZOR Bitcoin hardware wallet'
arch=('any')
depends=('protobuf'
         'python'
         'python-ecdsa'
         'python-hidapi'
         'python-mnemonic'
         'python-click'
         'python-pyblake2'
         'python-protobuf'
         'python-requests'
         'python-construct')
makedepends=('python-setuptools')
url='https://github.com/trezor/python-trezor'
license=('LGPL3')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/62/47/b188966e10effe4b7444c42c9717e161e0edc277b4878d2495d6c09760cd/trezor-0.11.1.tar.gz)
sha256sums=('6043f321d856e1b45b9df0c37810264f08d065bb56cd999f61a05fe2906e9e18')
provides=('python-trezor' 'trezorctl')
conflicts=('trezorctl')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
