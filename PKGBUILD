# Maintainer: Philipp Nowak <nowak dot philipp97 at gmail dot com>
pkgname=c_formatter_42
pkgver=0.2.8
pkgrel=1
pkgdesc="C formatter for 42 norminette"
arch=('x86_64')
url="https://github.com/dawnbeen/c_formatter_42"
license=('GPL')
depends=('python>=3.8' 'python-setuptools' 'gcc-libs' 'zlib' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dawnbeen/c_formatter_42/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4e1f6b0a618971b7ff6ff13ac5a3aaef855ca49e89bf76ad78832bee0c6b096be04c341c37133ffb13176b76a69a631ec8a4f12c5424608c2444736dcadd2fbb')
options=(!debug)	# To prevent debug package

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
