# Mantainer: Philipp Koppenstein philipp@koppenstein.com

_pkgname=pandocode
pkgname="python-${_pkgname}-git"
pkgver='20190524.5c8c531'
pkgrel=1
pkgdesc='pandocode is a pandoc filter that converts Python (-like) code to LaTeX-Pseudocode.'
source=("${_pkgname}::git+https://github.com/nzbr/pandocode.git")
depends=('pandoc-panflute' 'python' 'python-setuptools' 'zip')
license=('ISC')
arch=('any')

makedepends=('python-pylint')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")

sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}

