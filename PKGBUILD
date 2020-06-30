# Maintainer: Brandon Clifford <brandon099 at gmail dot com>
_pkgname=siji
pkgname=${_pkgname}-git
pkgver=r23.c691f20
pkgrel=1
pkgdesc='Iconic bitmap font based on stlarch with additional glyphs'
arch=('any')
url='https://github.com/stark/siji'
license=('GPLv2')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-xset')
optdepends=('xorg-xfd: use view.sh script to view glyphs')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/stark/siji")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m644 bdf/siji.bdf "${pkgdir}/usr/share/fonts/misc/siji.bdf"
  install -D -m755 view.sh "${pkgdir}/usr/share/${_pkgname}/view.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
