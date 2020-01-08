# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-ufoprocessor
_name=ufoProcessor
pkgver=1.8
pkgrel=1
pkgdesc="Python package based on fontTools.designSpaceLib for processing and generating UFO files."
arch=('any')
url="https://github.com/LettError/ufoProcessor"
license=('MIT')
depends=('python-fontparts' 'python-mutatormath')
makedepends=('python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha256sums=('ee0ceaa07446c37fa68c6bc1f31716d37b9408c4cf9f782441054a6a99ac7264')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
