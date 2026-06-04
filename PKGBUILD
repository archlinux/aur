# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Fruchix
_pkgname=star
pkgname=${_pkgname}-bin
pkgver=2.2.0
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
sha256sums_x86_64=('3d1fccdac41c290a14acaccdf3ceee5699e5b2fce73084d2c1cb926e265a3565')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	./configure --prefix="${pkgdir}/usr/"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	./install.sh
}
