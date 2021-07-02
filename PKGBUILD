# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-cloup
_name=cloup
pkgver=0.9.0
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
sha512sums=('9da24666b61c11626010fa95d8b69945bcb59aff73cc98d8636cd748f102e218c940ab0936ab677d0ca1cab823eb69ea521f8c1f70984a8e20489b0179e803f8')

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

