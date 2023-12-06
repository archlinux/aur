# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=dockbarx-mate-applet
pkgname=${_pkgname}-git
pkgver=1.0+1+g393d469
pkgrel=1
pkgdesc="DockBarX MATE applet"
arch=('any')
url="https://github.com/xuzhen/dockbarx-mate-applet"
license=('GPL3')
depends=('dockbarx>=1.0beta3+9+g6c3abc0' 'mate-panel')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'dockbarx<1.0beta3+9+g6c3abc0')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's:^v::;s:-:+:g'
}

build() {
  cd "${_pkgname}"
  make PREFIX=/usr
}
package() {
  cd "${_pkgname}"
  make PREFIX="${pkgdir}"/usr install
}
