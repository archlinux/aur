# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-halo
_name=${pkgname#python-}
pkgver=0.0.28
pkgrel=1
pkgdesc="Beautiful terminal spinners in Python"
arch=('any')
url="https://github.com/manrajgrover/${_name}"
license=('MIT')
depends=('python' 'python-log_symbols' 'python-spinners' 'python-cursor' 'python-termcolor' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9ebf98b94a43f3b68e18c6d74dcb1ea58446b8457ce6fb1b2b4cac8d83733f80')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
