# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=python-textual_imageview
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple terminal-based image viewer."
url="https://github.com/adamviola/textual-imageview"
license=('MIT')
arch=('any')
depends=('python' 'python-pillow' 'python-rich' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
sha256sums=('4299d8ed677db0adb8fe945687470cf1421dcafd2a5dddab54b6ee8ef2ab3320')
