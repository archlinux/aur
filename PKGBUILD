# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=107
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell')
makedepends=('gnome-common')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('109a2625ed24121d47d1d4891531c732a779fd35c116265ad4c2d21984c1afd6')

build() {
  cd "${_pkgbase}-v${pkgver}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${_pkgbase}-v${pkgver}"
  make DESTDIR=${pkgdir} install
}
