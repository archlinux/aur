# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
## Contributor: realasking

pkgname=python-genanki-git
_gitname=genanki
pkgver=0.13.0.r7.g0fa4f74
pkgrel=1
pkgdesc='Python 3 library for programatically generating Anki decks'
arch=(x86_64 i686)
url='https://github.com/kerrickstaley/genanki'
license=('MIT')
depends=('python' 'python-cached-property' 'python-frozendict' 'python-chevron' 'python-yaml')
makedepends=('git' 'python-setuptools' 'python-pytest-runner')
provides=('genanki' 'python-genanki')
conflicts=('genanki' 'python-genanki')
source=('git+https://github.com/kerrickstaley/genanki.git')
b2sums=('SKIP')

pkgver(){
	cd "${_gitname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "${_gitname}"
	python setup.py build
}

package() {
	cd "${_gitname}"
	python setup.py install --root="$pkgdir" --optimize=1
}
