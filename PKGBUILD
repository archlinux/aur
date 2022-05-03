# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=110
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('68c83af5ae2c02539e48d989c939cd930cbb25e4f39ee9360bb459e7f09f18df')

build() {
  cd "${_pkgbase}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgbase}-v${pkgver}"
  make VERSION=${pkgver} DESTDIR=${pkgdir} install
}
