# Maintainer: Tiago Danin <TiagoDanin@outlook.com>
_pkgname=ghoffline
pkgname=${_pkgname}-git
pkgver=9.c73bdc9
pkgrel=1
pkgdesc='Check offline site in a repository of Github'
arch=('any')
url='https://tiagodanin.github.io/ghoffline/'
license=('GPL3')
depends=('python')
makedepends=('git')
source=('git://github.com/tiagodanin/ghoffline.git')
md5sums=('SKIP')

pkgver() {
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd ${_pkgname}
	python setup.py build
}

package() {
	cd ${_pkgname}
	python setup.py install --root=${pkgdir} --optimize=1
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}
}
