# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx-mate-applet
pkgver=1.0+1+g393d469
pkgrel=1
pkgdesc="DockBarX MATE applet"
arch=('any')
url="https://github.com/xuzhen/dockbarx-mate-applet"
license=('GPL3')
depends=('dockbarx>=1.0beta3+9+g6c3abc0' 'mate-panel')
conflicts=('dockbarx<1.0beta3+9+g6c3abc0')
_commit='393d469bcc7deff7f09e596cc3284b399f546369'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's:^v::;s:-:+:g'
}

build() {
  cd "${pkgname}"
  make PREFIX=/usr
}
package() {
  cd "${pkgname}"
  make PREFIX="${pkgdir}"/usr install
}
