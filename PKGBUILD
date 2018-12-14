# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.11.0
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
         'python-requests')
makedepends=('python-setuptools')
url='https://github.com/trezor/python-trezor'
license=('LGPL3')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/2e/75/9b957d9ce0a86fdfa11c2a2510e524dc9b214e6c2f6864d9a7903bf41d72/trezor-0.11.0.tar.gz)
sha256sums=('1132f6a97afb0979c5018b067494bc8917b881c02d965f991270a70543b5050c')
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
