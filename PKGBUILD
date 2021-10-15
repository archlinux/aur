# Maintainer: Groctel <aur@taxorubio.com>

_name=cloup

pkgname=python-cloup
pkgver=0.12.1
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=('any')
license=('MIT')
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6d360b7c6ea6148d307d435a78e557ba14d22ae2044096a9a2b346847c16ca7fa8404556be763c23a3c63f5a7949a99166267a4a2e5491222087300d25340a9c')

depends=('python')
makedepends=(
	'python-setuptools'
	'python-setuptools-scm'
)

build ()
{
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
