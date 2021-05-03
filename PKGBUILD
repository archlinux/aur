# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-cloup
_name=cloup
pkgver=0.7.1
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."
arch=('any')
url="https://github.com/janLuke/cloup"
license=('MIT')
makedepends=(
	'python-setuptools'
	'python-setuptools-scm'
)
provides=()
source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('495e7a083137e07cc0ce8b3b9ba4a98a43a25f535775b5efb8570cd682dca6f70bf4d183e49c06093e68d524e3c25002e91b41172e456add51dc1ea52f5cfe9f')

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

