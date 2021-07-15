# Maintainer: Groctel <aur@taxorubio.com>

_name=cloup

pkgname=python-cloup
pkgver=0.10.0
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=('any')
license=('MIT')
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('37647a29a7297458e11f361f6699c457bda3a1aba0539444ffef5e8be4ace7081fbeb4ed6809da338ca78ba75f42c5db903275e976ecd28c41822bbc3183810d')

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
