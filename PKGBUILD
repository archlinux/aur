# Maintainer: chuvke <chuvke AT gmail DOT com>
pkgname=pygrid
pkgver=1.0.0.r15.g7f896fa
_pkgrevision=7f896faa40c0187178ad8b5fc8138cf97042097b
pkgrel=1
pkgdesc="Quickly place and move windows around the X11 desktop using a grid"
arch=('i686' 'x86_64')
url="https://github.com/pkkid/pygrid"
license=('GPL2')
depends=(python python-gobject python-xlib) 
makedepends=('git')
source=("${pkgname}::git+https://github.com/pkkid/${pkgname}.git#commit=${_pkgrevision}"
        "pygrid.desktop")
sha256sums=('SKIP'
            'd39d8dae7f8326a41309132101175a36bd042e42f2cfde15cf8c12a69b5ef945')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm 644 "pygrid.desktop" "${pkgdir}/etc/xdg/autostart/pygrid.desktop"

  cd "$pkgname"
  install -Dm 755 "pygrid.py" "${pkgdir}/usr/bin/pygrid"
}
