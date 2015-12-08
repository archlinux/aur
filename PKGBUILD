# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>
_tarname='Delorean'
pkgname='python2-delorean'
pkgdesc='Library providing a more convenient use of datetimes'
pkgver='0.5.0'
pkgrel='1'
license=('custom:MIT')
arch=('any')
depends=('python2-pytz' 'python2-dateutil')
source=("https://pypi.python.org/packages/source/D/Delorean/${_tarname}-${pkgver}.tar.gz")
sha512sums=('0206e2953f9f0f5ea151b1d0ab34549249e42fffb4a92aa7a5024c15b21a6aeb310ff9c06c0bdc3eb76d887587d13dadbd3c8588504ccf094c864923b3307fb6')

package () {
	cd "${_tarname}-${pkgver}"
	sed '/usr\/bin\/env/s/python/python2/' -i setup.py
	python2 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
