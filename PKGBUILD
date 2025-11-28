# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Fruchix
_pkgname=star
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A Unix command line bookmark manager"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('bash' 'zsh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}.tar.gz")
sha256sums_x86_64=('f477b43359d14df86ced45a072a4da19316195bba3d2cc9664a7e7d3468fccc5')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	./configure --prefix="${pkgdir}/usr/"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	./install.sh
}
