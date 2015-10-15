# Maintainer: Brandon Clifford <brandon099 at gmail dot com>
_pkgname=siji
pkgname=${_pkgname}-git
pkgver=r18.ea240bd
pkgrel=1
pkgdesc='Iconic bitmap font based on stlarch with additional glyphs'
arch=('any')
url='https://github.com/gstk/siji'
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/gstk/siji")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}/pcf"
  install -D -m644 siji.pcf "${pkgdir}/usr/share/fonts/misc/siji.pcf"
}
