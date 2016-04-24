# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=i3-sensible-browser-git
_pkgname=i3-sensible-browser
pkgver=18.a537351
pkgrel=1
pkgdesc='Launches $BROWSER with fallbacks'
url='https://gitlab.com/ilpianista/i3-sensible-browser'
arch=('any')
license=('GPL')
makedepends=('git')
source=(${_pkgname}::'git+https://gitlab.com/ilpianista/i3-sensible-browser.git')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
