# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-ufoprocessor
_name=ufoProcessor
pkgver=1.8
pkgrel=1
pkgdesc="Python package based on fontTools.designSpaceLib for processing and generating UFO files."
arch=('any')
url="https://pypi.org/project/ufoProcessor"
license=('MIT')
depends=('python-fontparts' 'python-mutatormath')
makedepends=('python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip"
        "https://raw.githubusercontent.com/LettError/ufoProcessor/master/LICENSE")
sha256sums=('ee0ceaa07446c37fa68c6bc1f31716d37b9408c4cf9f782441054a6a99ac7264'
            '74d9535fd3ba85f8e30a6ae8c519cd96fdced95dc3cbb0b0227d7e60f6a210dd')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
