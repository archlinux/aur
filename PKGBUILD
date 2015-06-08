# Contributor: Colin Jones (xentalion) <colin@ergoeclectic.com>
# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

_pkgname=cbatticon
pkgname=cbatticon-git
pkgver=0.r58.652d99b
pkgrel=1
pkgdesc='A lightweight and fast battery icon that sits in your system tray'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/valr/cbatticon'
license=('GPL2')
depends=('libnotify' 'gtk2')
makedepends=('git')
provides=('cbatticon')
conflicts=('cbatticon')

source=("$_pkgname"::'git+https://github.com/valr/cbatticon.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgname}"
}

package() {
  make -C "${_pkgname}" PREFIX="${pkgdir}/usr" install
}
