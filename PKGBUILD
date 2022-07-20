# Maintainer: Groctel <aur@taxorubio.com>

_name=cloup

pkgname=python-cloup
pkgver=1.0.0
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=('any')
license=('MIT')
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9787b3a120dde54b75506a707108444b40b258e5123855dc33b3af27d6394d67e20de236451143ca73000b1d75842d166dd996893f4fbf4341f3f2d7a4da0127')

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
