# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-aioimaplib
pkgver=0.9.0
pkgrel=2
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python>=3.5' 'python3')
makedepends=('python-setuptools')
checkdepends=(
	'python-asynctest'
	'python-docutils'
	'python-imaplib2' ## AUR
	'python-mock'
	'python-nose'
	'python-pyopenssl'
	'python-pytz'
	'python-twine'
	'python-tzlocal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3d4700f019e7a6459a6b88ef5f1ee3441f600554938490405f172313835e2749')

build() {
	cd "aioimaplib-$pkgver"
	python setup.py build
}

check() {
	cd "aioimaplib-$pkgver"
	python setup.py nosetests
}

package() {
	cd "aioimaplib-$pkgver"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
