# Maintainer: robertfoster

pkgname=python2-trezor
pkgver=0.11.4
pkgrel=1
pkgdesc='Python 2 library for communicating with the TREZOR Bitcoin hardware wallet'
arch=('any')
depends=('protobuf'
	'python2'
	'python2-ecdsa'
	'python2-hidapi'
	'python2-mnemonic'
	'python2-click'
	'python2-pyblake2'
	'python2-protobuf'
	'python2-requests'
	'python2-construct'
	'python2-libusb1'
'python2-typing')
makedepends=('python2-setuptools')
url='https://github.com/trezor/python-trezor'
license=('LGPL3')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/65/a3/0c472afba8e878df36480860da3f117407a9542a942e712861e73fc051df/trezor-0.11.4.tar.gz')
provides=('python2-trezor' 'trezorctl')
conflicts=('trezorctl')

build() {
	cd "$srcdir/${pkgname#python2-}-$pkgver"

	msg2 'Building...'
	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname#python2-}-$pkgver"

	msg2 'Installing...'
	python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('7bfc2aac7de41ce03e88fde5d59afa7e')
