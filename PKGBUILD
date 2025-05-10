# Maintainer: Walter - "bWVAd2FsdGVyY2FzYW5vdmEueHljCg=="
# indent = tab
# tab-size = 4

pkgname='sgfmill-git'
_pkgname='sgfmill'
pkgver=1.1.1.r11.gc87cb41
pkgrel=1
pkgdesc="Sgfmill is a Python library for reading and writing Go game records using Smart Game Format (SGF)."
arch=('i686' 'x86_64')
url="https://github.com/mattheww/sgfmill"
license=('MIT')
depends=('python' 'python-sphinx' )
makedepends=('python-setuptools' 'git')
provides=('sgfmill')
conflicts=('sgfmill')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --abbrev=7 | sed 's/^sgfmill-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
