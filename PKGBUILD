# Maintainer: Tommy Li <ttoo74@gmail.com>
pkgname=python-d2l
_name=${pkgname#python-}
pkgver=0.8.7
pkgrel=1
pkgdesc="Dive into Deep Learning Book Utilities"
arch=(any)
url="http://d2l.ai/"
license=('Apache')
depends=("python" "python-numpy" "python-matplotlib" "jupyter")
makedepends=()
checkdepends=()
optdepends=()
options=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7e921ed7a29b9f5966149a4e55089688c1d5d9a77f93940da292a6017d4799c2')

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
