# Maintainer: Philipp A. <flying-sheep@web.de>

_name=sinfo
pkgname=python-$_name
pkgver=0.3.1
pkgrel=1
pkgdesc='outputs version information for modules loaded in the current session, Python, and the OS.'
arch=(any)
url="https://gitlab.com/joelostblom/$_name"
license=(BSD)
depends=(python python-stdlib-list)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e1b2358808aded7b2ff00ea0cd4e6a2d978fb2a44ee9b15ac23d64a81bf62706')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
