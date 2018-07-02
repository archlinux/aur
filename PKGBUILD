# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.10.2
pkgrel=1
pkgdesc="Python 3 library for communicating with the TREZOR Bitcoin hardware wallet"
arch=('any')
depends=('protobuf'
         'python'
         'python-ecdsa'
         'python-hidapi'
         'python-mnemonic'
         'python-protobuf'
         'python-requests')
makedepends=('python-setuptools')
url="https://github.com/trezor/python-trezor"
license=('LGPL3')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/4e/98/b59ad74f5511154981e423b58b0bd03bc05d537ad120ee235dbaa10e37ea/trezor-0.10.2.tar.gz)
sha256sums=('4dba4d5c53d3ca22884d79fb4aa68905fb8353a5da5f96c734645d8cf537138d')
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
