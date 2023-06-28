# Maintainer: Philipp Nowak <nowak dot philipp97 at gmail dot com>
pkgname=c_formatter_42
pkgver=0.2.2
pkgrel=1
pkgdesc="C formatter for 42 norminette"
arch=('x86_64')
url="https://github.com/dawnbeen/c_formatter_42"
license=('GPL')
depends=('python>=3.7' 'python-setuptools' 'gcc-libs' 'zlib' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dawnbeen/c_formatter_42/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e1000aa3f21797070b94c52b4bbf63329743d44d252cb25bdd9cb94ffaa4a33deb45b92d592cc55d31e2da9edd4263511fe9e3ae97d733d6b391c21dee23e580')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
