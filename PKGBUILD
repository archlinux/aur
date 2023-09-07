# Maintainer: Philipp Nowak <nowak dot philipp97 at gmail dot com>
pkgname=c_formatter_42
pkgver=0.2.4
pkgrel=1
pkgdesc="C formatter for 42 norminette"
arch=('x86_64')
url="https://github.com/dawnbeen/c_formatter_42"
license=('GPL')
depends=('python>=3.7' 'python-setuptools' 'gcc-libs' 'zlib' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dawnbeen/c_formatter_42/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7b45723f9c2ef44b58301783055b686e376c8ef2740632caa2e1dd6455cb216297a50d61dcf00169cc0c5389da0d353ba451d0e941e66c7f2f2d30ae165016c9')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
