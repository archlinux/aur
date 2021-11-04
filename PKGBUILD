# Maintainer: Wali Waqar <waliwaqars@gmail.com>

pkgname=pensela-bin
_pkgver=v1.2.4
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc="The Swiss Army Knife of Screen Annotation Tools"
arch=('x86_64')
url="https://github.com/weiameili/Pensela"
license=('ISC')
conflicts=()
depends=('imagemagick')
_filename=pensela-${pkgver}.pacman
source=("$url/releases/download/${_pkgver}/${_filename}")
noextract=("${_filename}")
sha256sums=('50abbfc3471d7bf4e2045fe90bdbd196dcc9e2fe9540aa8a3d0bfef12757c965')
options=(!strip)

package() {
	tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/Pensela/pensela" "$pkgdir/usr/bin/pensela"
}
