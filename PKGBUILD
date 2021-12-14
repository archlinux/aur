# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-ufoprocessor
_name=ufoProcessor
pkgver=1.9.0
pkgrel=5
pkgdesc='library to process and generate UFO files based on fontTools.designSpaceLib'
arch=(any)
url="https://github.com/LettError/$_name"
license=(MIT)
depends=(python-mutatormath
         python-fontparts)
makedepends=(python-setuptools-scm)
_archive="$_name-$pkgver"
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_archive.zip")
sha256sums=('baa8bd9bbbb11ce004647eb1906105f4d5bfdbc1b3388ca4d36fab57950a415b')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
