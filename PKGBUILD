# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=quake3-rally
pkgver=0.0.0.4
pkgrel=0
epoch=1
pkgdesc="A car driving and car combat game based on the Quake III Arena engine"
arch=('any')
url="https://sourceforge.net/projects/q3rallysa/"
license=('GPL2')
depends=('quake3')
makedepends=('unrar')
_srcname="q3rally_v${pkgver//./}_linux_x86"
source=("https://downloads.sourceforge.net/project/q3rallysa/Pre-Alpha%20Releases/${_srcname}.rar")
noextract=("${_srcname}.rar")
sha256sums=('e31976b42778d92db26d5d6aa59cd95411bbb908ad53c5a13f5a3472f6f875ad')

prepare() {
  unrar x -o+ "${_srcname}.rar"
}

package() {
  cd "${_srcname}"

  # Remove unneeded files
  rm baseq3r/*.so

  # Copy mod files
  mkdir -p "${pkgdir}/opt/quake3"
  cp -dR baseq3r "${pkgdir}/opt/quake3"
}

# vim:set ts=2 sw=2 et:
