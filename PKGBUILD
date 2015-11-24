# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xtrkcad-ru
pkgver=4.2.2
pkgrel=1
pkgdesc="Russian translate for XtrkCAD program."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('xtrkcad')
optdepends=()
makedepends=('gettext')
conflicts=()
provides=()
backup=()
source=("https://raw.githubusercontent.com/CupIvan/${pkgname}/master/${pkgver}/xtrkcad.po")
sha256sums=('757afc35d1a5cb9e5ed473fdc9a08155b057caddb23f9d838c97c0ca8ddc399d')

build() {
  msgfmt xtrkcad.po -o xtrkcad.mo
}

package() {
  install -Dm644 "xtrkcad.mo" "${pkgdir}/usr/share/locale/ru/LC_MESSAGES/xtrkcad.mo"
}
