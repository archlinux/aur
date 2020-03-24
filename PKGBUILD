# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-ufoprocessor
_name=ufoProcessor
pkgver=1.9.0
pkgrel=1
pkgdesc="Python package based on fontTools.designSpaceLib for processing and generating UFO files."
arch=('any')
url="https://github.com/LettError/ufoProcessor"
license=('MIT')
depends=('python-fontparts' 'python-mutatormath')
makedepends=('python-setuptools-scm' 'python-wheel')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.zip")
sha256sums=('baa8bd9bbbb11ce004647eb1906105f4d5bfdbc1b3388ca4d36fab57950a415b')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
