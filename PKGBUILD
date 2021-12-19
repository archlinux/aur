# Maintainer: Philipp A. <flying-sheep@web.de>

_name=sinfo
pkgname=python-$_name
pkgver=0.3.4
pkgrel=1
pkgdesc='outputs version information for modules loaded in the current session, Python, and the OS.'
arch=(any)
url="https://gitlab.com/joelostblom/$_name"
license=(BSD)
depends=(python python-stdlib-list)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('81ea91c69a875de178e10bada9476d7300a1f712e1823dbd7714f43a10baba4d')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
