# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-argclass-git
pkgver=0.8.0.r0.41d5b8c
pkgrel=2
pkgdesc="A wrapper around the standard argparse module that allows you to describe argument parsers declaratively "
arch=('i686' 'x86_64')
url="https://github.com/mosquito/argclass"
license=('Apache 2.0')
depends=('python>=3')
makedepends=('python-setuptools')
source=("${pkgname%-git}::git+https://github.com/mosquito/argclass.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python -m pip install --root "$pkgdir" .
}
