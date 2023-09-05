# Maintainer: Alirn <alirn76@yahoo.com>
# Contributor: Mahan Bakhshi <>
pkgname=python-panther
_name=panther
pkgver=2.4.1
pkgrel=1
pkgdesc="Fast & Friendly Python Web Framework"
arch=('any')
url='https://pantherpy.github.io/'
license=('BSD 3 Clause')
depends=( 'bpython' 'python-bson' 'python-pantherdb' 'python-pydantic' 'python-httptools' 'python-uvicorn' 'python-rich' 'python-watchfiles' 'python-jose' 'python-greenlet' )
makedepends=( 'git' 'python-setuptools' 'python-installer' 'python-wheel' )
optdepends=('python-pymongo: mongodb support')
source=('${_name}::git+https://github.com/AliRn76/panther.git')
md5sums=('SKIP')

build() {
	cd "{$_name}"
	python setup.py build
}

check() {
  cd "{$_name}"
  python setup.py test
}

package() {
	cd "{$_name}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm664 LICENSE "${pkgdir}/usr/share/licenses/${_name}/license"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_name}/README.md"
}
