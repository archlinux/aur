# Maintainer: Radim Sückr <contact@radimsuckr.cz>

pkgname=developers-chamber
pkgver=0.0.44
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
            '0dd0503b51b2f9110ce7be1d3a5896f6553950cbb6f9bca8a9be89d5529d383a8642bd1c27355ba6a4dfe74ced6562c15b95b805dce88ac788bdd89600010d54')

prepare() {
	cd ${pkgname}
    patch --forward --strip=1 --input="${srcdir}/setup.patch"
	python setup.py build
}

package() {
	cd ${pkgname}
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
