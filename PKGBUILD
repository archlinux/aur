# Maintainer: Philipp Nowak <nowak dot philipp97 at gmail dot com>
pkgname=c_formatter_42
pkgver=0.2.3
pkgrel=1
pkgdesc="C formatter for 42 norminette"
arch=('x86_64')
url="https://github.com/dawnbeen/c_formatter_42"
license=('GPL')
depends=('python>=3.7' 'python-setuptools' 'gcc-libs' 'zlib' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dawnbeen/c_formatter_42/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('df9daf6e72f4c150f9335d74cdd740024a42d82f05c0da5921c5fd6b8bd6d96ac4c6d42dd95483b49f358dd5aef08dfe0b64bafdae3de285c71510f0862d29b2')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
