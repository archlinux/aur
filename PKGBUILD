# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-agda-kernel
_name=agda_kernel
pkgver=0.64
pkgrel=3
pkgdesc="A rudimentary Jupyter kernel for Agda"
arch=('any')
url="https://github.com/lclem/agda-kernel"
license=('CCPL:by')
makedepends=('python-setuptools')
depends=('agda' 'python-jupyter-client')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('A515FF4E188B55D2841D92E3305E0C2A1C6C612D88EF53A56297EDC9DDE6965C')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	python src/$_name/install.py --prefix="$pkgdir/usr"
}