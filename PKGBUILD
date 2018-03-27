# Maintainer: sasvari
_pkgname="SL-CLI"
pkgname="python-sl-cli-git"
pkgver=1.1.r136.g2f0b76c
pkgrel=1
pkgdesc="Stockholms Lokaltrafik - Command Line Interface"
arch=(any)
url="https://github.com/Sebelino/$_pkgname"
license=("MIT")
depends=("python" "python-xmltodict")
makedepends=("git")
provides=("python-sl-cli")
provides=("python-sl-cli")
source=("git+https://github.com/Sebelino/$_pkgname.git")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build () {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}
md5sums=('SKIP')
