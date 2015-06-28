# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='python-lasso'
_pypiname=${pkgname#python-}
pkgdesc='Lightweight module to define serializable, schema-validated classes'
pkgver='0.0.2'
pkgrel=1
arch=('any')
license=('custom:MIT')
url="https://github.com/aperezdc/${pkgname}"
depends=('python-schema' 'python-delorean')
source=("https://pypi.python.org/packages/source/l/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
	COPYING)
md5sums=('915022691be5d972ebc35c4adab9d734'
         '0e0f33b93b6e3cbb30bfde284d35a516')
sha512sums=('171a22d380b4fa415d25c3ea73fd1e9681d5c23c7a25bd31e635ba849e42f0ed10d94e5d466c19b95b7d11a858ef97f39971d25df9937d818d0192ddfe3e2d90'
            'aa09f964180fbd1db3337ba82af84787ff57ab57d17e665dfab69f70834600f5ae18bce92e7c65036fc7d13015dd3107528cacf08886ee9a3e3bf3916e8e2efe')

package () {
	cd "${_pypiname}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 "${srcdir}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
