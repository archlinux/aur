# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_pkgname=openweather
pkgname=gnome-shell-extension-openweather
pkgver=116
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Shell"
arch=('any')
url="https://gitlab.com/skrewball/openweather"
license=('GPL3')
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('8c7735b2961a5c4ce0dc326ea7cacb2544282686ca2f8b7e26ee71ba90771c67')

build() {
  cd "${_pkgname}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgname}-v${pkgver}"
  make DESTDIR=${pkgdir} install
}
