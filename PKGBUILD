# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
_tarname='Delorean'
pkgname=python-delorean
pkgdesc='Library providing a more convenient use of datetimes'
pkgver=1.0.0
pkgrel=1
url=http://delorean.readthedocs.org/
license=(custom:MIT)
arch=(any)
depends=(python-pytz python-dateutil python-humanize python-tzlocal)
source=("https://pypi.python.org/packages/source/D/Delorean/${_tarname}-${pkgver}.tar.gz")
sha512sums=('7514145d0084d8f0697b7ae078e35087b64d723ef6d20b105a72bf84a5f122eb69693aec59c7d574a1b57f114ba4269f31931bdfc54cfeac32a98add9eec05e3')

package () {
	cd "${_tarname}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
