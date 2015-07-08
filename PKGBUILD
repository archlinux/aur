# Maintainer: knucker <www.knucker[at]gmail.com>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=python2-hexdump
_pyname=hexdump
_hghash=7450ca489143
pkgver=3.2
pkgrel=2
pkgdesc='Cross-platform Python 2/3 library and tool to work with hex and binary data.'
arch=('any')
url='https://bitbucket.org/techtonik/hexdump'
license=('Public Domain')
depends=('python2')
source=(${pkgname}-${pkgver}.tar.bz2::https://bitbucket.org/techtonik/${_pyname}/get/${pkgver}.tar.bz2)
sha512sums=('1739a050ccea46b8568cf624d4cf32d7205e52b06b43ce196e53528e202516e727498029ebb0e2a4cdce27332b4989e26a6b9e3c49cbce7ab4497dad410131ee')

check() {
	cd "techtonik-${_pyname}-${_hghash}"
	/usr/bin/env python2 hexdump.py --test test.txt
	diff -u3 hextest.txt test.txt
}

package() {
	cd "techtonik-${_pyname}-${_hghash}"
	/usr/bin/env python2 setup.py install --root="${pkgdir}" -O1 --prefix=/usr
}

# vim:set ts=4 sw=4 ft=sh et:
