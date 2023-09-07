# Maintainer: Mahan Bakhshi <mahanbakhshi03@gmail.com>
pkgname=python-pantherdb
_name=pantherdb
pkgver=2.4.1
pkgrel=1
pkgdesc="PantherDB is a Simple, FileBase and Document Oriented database that you can use in your projects"
arch=('any')
url='https://github.com/PantherPy/pantherdb'
license=('MIT')
makedepends=( 'git' 'python-setuptools' 'python-installer' 'python-wheel' )
source=('git+https://github.com/PantherPy/pantherdb.git')
md5sums=('SKIP')

build() {
	cd "{$_name}"
	python setup.py build
}

package() {
	cd "{$_name}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm664 LICENSE "${pkgdir}/usr/share/licenses/${_name}/license"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_name}/README.md"
}
