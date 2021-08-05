# Maintainer: Groctel <aur@taxorubio.com>

_name=cloup

pkgname=python-cloup
pkgver=0.11.0
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=('any')
license=('MIT')
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('89a8aad150e8ffe16c6e6ef2be4053320de99fcfbba45f18b4db085cb0401764a079b6952aa4042d143d4f5e3f20987524189263e10b96df33623bb5c0454227')

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
