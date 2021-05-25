# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-cloup
_name=cloup
pkgver=0.8.2
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
sha512sums=('85f494af0cbea8791bd23edcc69f6a152ebffbac8ba2a51568714e052c03b748fc09a263aaf73146b290e5d4ecc247accd8ebff6a1c707b916c2bf8bff12928b')

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

