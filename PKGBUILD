# Maintainer: Paul Irofti <paul@irofti.net>

_name=casadi
pkgname="octave-${_name}"
pkgver=3.6.5
pkgrel=2
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="https://github.com/casadi/casadi"
license=('GPL3')
depends=('octave')
source=("${pkgname}-${pkgver}.zip"::"https://github.com/${_name}/${_name}/releases/download/${pkgver}/${_name}-${pkgver}-linux64-octave7.3.0.zip")
sha256sums=('7a271ecd55bf2c1487d45e6b612ffbc04fb2f79dbcedd5f44c7302a3b65cdcea')

_install_dir() {
	src=$1
	dst=$2
	mkdir -p "$(dirname "$dst")"
	cp -rT "$src" "$dst"
}

package() {
	prefix="${pkgdir}/opt/${pkgname}"
	_install_dir "$srcdir" "$prefix"
}
