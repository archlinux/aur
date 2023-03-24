# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python312-as-default-interpreter'
pkgver='1'
pkgrel=1
pkgdesc="Add necessary linking to make the python312 package the default interpreter; remove the 'python' package by conflicting it"
url=""
depends=(
	'python312'
)
conflicts=(
	'python<3.11'
	'python311-as-default-interpreter'
)
license=('GPL')
arch=('any')

package() {
	mkdir "${pkgdir}/usr/bin" -p
	cd "${pkgdir}/usr/bin"
	
	ln -s -r python3		./python
	ln -s -r python3.12		./python3
	ln -s -r python3-config		./python-config
	ln -s -r python3.12-config	./python3-config
	ln -s -r idle3			./idle
	ln -s -r idle3.12		./idle3
	ln -s -r 2to3-3.12		./2to3
	ln -s -r pydoc3			./pydoc
	ln -s -r pydoc3.12		./pydoc3

	mkdir "${pkgdir}/usr/share/man/man1" -p
	cd "${pkgdir}/usr/share/man/man1"

	ln -s -r python3.1.gz		python.1.gz
	ln -s -r python3.12.1.gz	python3.1.gz
}
