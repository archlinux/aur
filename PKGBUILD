# Contributor: bitwave <aur@oomlu.de>

_base=ohmu
pkgname=python2-${_base}
pkgver=1.1.0
pkgrel=1
pkgdesc="View space usage in your terminal"
arch=(any)
url="https://gitlab.com/paul-nechifor/${_base}"
license=(MIT)
depends=(python2-scandir)
makedepends=(python2-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('fb27c6094dd57d949d297620485f43e4fd98bbe95a3f42e9dd0b46601b1956a370f453153221f40aa451b748bec564e61d17ca239b1d129b0ec14a756dc00965')

build() {
	cd ${_base}-${pkgver}
	python2 setup.py build
}

package() {
	cd ${_base}-${pkgver}
	python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
