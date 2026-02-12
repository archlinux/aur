# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Fruchix
_pkgname=star
pkgname=${_pkgname}-bin
pkgver=2.1.0
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
sha256sums_x86_64=('adc1e56d83bc24ce776277bd268a0bc640ea5a9e532338f8aa26e8766f715dbe')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	./configure --prefix="${pkgdir}/usr/"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	./install.sh
}
