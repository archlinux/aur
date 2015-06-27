# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='python-lasso'
_pypiname=${pkgname#python-}
pkgdesc='Lightweight module to define serializable, schema-validated classes'
pkgver='0.0.1'
pkgrel=1
arch=('any')
license=('custom:MIT')
url="https://github.com/aperezdc/${pkgname}"
depends=('python-schema' 'python-delorean')
source=("https://pypi.python.org/packages/source/l/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
	COPYING)
md5sums=('9ee235bd60ec54dc027330bcf0717abd'
         '0e0f33b93b6e3cbb30bfde284d35a516')
sha512sums=('3eeace2373e6dbd8c67a0ef25ccf0aa7a7bce510ca403892d2cce1b7a6f9b72d067917c71c51e7e5ba1646be901a3b3ae635fe86dd65ce8747c5d52d88430eda'
            'aa09f964180fbd1db3337ba82af84787ff57ab57d17e665dfab69f70834600f5ae18bce92e7c65036fc7d13015dd3107528cacf08886ee9a3e3bf3916e8e2efe')

package () {
	cd "${_pypiname}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 "${srcdir}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
