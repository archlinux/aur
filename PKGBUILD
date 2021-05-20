# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-cloup
_name=cloup
pkgver=0.8.0
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
sha512sums=('fe425753f514c733a86c33fca3a9974ba56bda5363d1211f06f723d3bebb32bb43cf25129bc2b04bcc66146642d26eecd5a11e56a5250efaf82f773dded9e8ea')

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

