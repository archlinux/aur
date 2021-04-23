# Maintainer: monosans

pkgname=python-minifier
_pkgname=python_minifier
pkgver=2.4.1
pkgrel=1
pkgdesc="Transform Python source code into it's most compact representation"
url=https://github.com/dflook/python-minifier
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://pypi.io/packages/source/p/${pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1220c5c71713e5a151fee70dcf96dd473dfdfc9d2ffbb70cb3c997b90cf39f8c')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
