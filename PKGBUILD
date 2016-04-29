# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
_tarname='Delorean'
pkgname='python-delorean'
pkgdesc='Library providing a more convenient use of datetimes'
pkgver='0.6.0'
pkgrel='2'
url='http://delorean.readthedocs.org/'
license=('custom:MIT')
arch=('any')
depends=('python-pytz' 'python-dateutil' 'python-humanize' 'python-tzlocal')
source=("https://pypi.python.org/packages/source/D/Delorean/${_tarname}-${pkgver}.tar.gz")
sha512sums=('ceb9adbed3086b4ae510d5aa2cc2b2a23f56bfb5e67dff6b34b94c977f58de2745ef736421a4650f98486cb5e9e79c78e95954372620f6f240e0f8da4a6c9d30')

package () {
	cd "${_tarname}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
