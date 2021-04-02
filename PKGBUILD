# Maintainer: MoltenCoreDev <craxell.tv@gmail.com>

_pkgname="pyfetch"
pkgname="${_pkgname}-git"
pkgver=r5.9c18074
pkgrel=1
pkgdesc="A simple and fast alternative to neofetch."
arch=('x86_64')
url="https://kreatea.ml/kreato/pyfetch"
license=('GPL3')
groups=()
depends=('csfml')
makedepends=('wmctrl' 'otf-font-awesome' 'python' 'python-pip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("https://kreatea.ml/kreato/pyfetch/raw/branch/master/pyfetch")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
	chmod +x pyfetch
	# install deps
	pip install distro psutil colorama
}


#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	# install built binary
	install -Dm 755 "pyfetch" "${pkgdir}/usr/bin/${_pkgname}"
}

