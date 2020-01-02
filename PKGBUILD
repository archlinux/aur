# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-protobuf-compiler
_name=protobuf_compiler
pkgver=1.0.20
pkgrel=1
pkgdesc="Compile all protobuf files and create a single package distribution for installing with pip"
arch=('any')
url="https://github.com/netsaj/python-protobuf-compiler"
license=('MIT')
depends=('python-grpcio-tools' 'python-colorama' 'python-termcolor' 'python-tqdm')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ac8daa7187fb9cac7752008368b79d8d8e44dd1b154423fa7afd227a31d062f6')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
