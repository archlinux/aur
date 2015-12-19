# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=i3-sensible-browser-git
_pkgname=i3-sensible-browser
pkgver=8.d4654a2
pkgrel=1
pkgdesc='Launches $BROWSER with fallbacks'
url='https://github.com/ascarpino/i3-sensible-browser'
arch=('any')
license=('GPL')
makedepends=('git')
source=(${_pkgname}::'git+https://github.com/ascarpino/i3-sensible-browser.git')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
