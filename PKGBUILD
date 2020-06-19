# Maintainer: Radim Sückr <contact@radimsuckr.cz>

pkgname=developers-chamber
pkgver=0.0.37
pkgrel=1
pkgdesc='Python developers utility library'
arch=('any')
url='https://github.com/druids/developers-chamber'
license=('MIT')
depends=(
	'python'
	'python-attrdict'
	'python-boto3'
	'python-click'
	'python-click-completion'
	'python-coloredlogs'
	'python-docker'
	'python-dotenv'
	'python-gitpython'
	'python-hosts'
	'python-isort'
	'python-jira'
	'python-oauthlib'
	'python-requests'
	'python-togglpy'
	'python-unidecode'
)
makedepends=('python-setuptools')
source=('git+https://github.com/druids/developers-chamber.git' 'setup.patch')
sha512sums=('SKIP'
            'd5f5879d6a23c7dfc15e9a0736936b211d052f20a5cc3aa88dc88d75007c93844dced7b1b4a051a11b8c347cf6aa8a5656a01e2c79ab3df15e243f5032df0fcf')

prepare() {
	cd ${pkgname}
    patch --forward --strip=1 --input="${srcdir}/setup.patch"
	python setup.py build
}

package() {
	cd ${pkgname}
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
