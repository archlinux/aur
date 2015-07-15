# contributor: fdev31 <fdev31@gmail.com>
_name=repoze.debug
pkgname=python2-$_name
pkgver=1.0.2
pkgrel=1
pkgdesc="Forensic debugging WSGI middleware"
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://static.repoze.org/whatdocs/"
depends=('python')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/r/$_name/$_name-$pkgver.tar.gz)
conflicts=('repoze.debug')
replaces=('repoze.debug')
md5sums=('6c989be54c7e94fc544ce84b14a2f13a')

build() {
	cd "${srcdir}/${_name}-${pkgver}"

	python2 setup.py install --root="${pkgdir}" || return 1
    rm -fr ${pkgdir}/usr/lib/python*/site-packages/repoze/debug/tests
}
