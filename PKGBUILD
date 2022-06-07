# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_pkgname=openweather
pkgname=gnome-shell-extension-openweather
pkgver=114
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Shell"
arch=('any')
url="https://gitlab.com/skrewball/openweather"
license=('GPL3')
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('0bfb5e6cc16e4a4117cd6c7bac16dd5afac8d7800d541e65de1c0d2bdfe5da73')

build() {
  cd "${_pkgname}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgname}-v${pkgver}"
  make DESTDIR=${pkgdir} install
}
