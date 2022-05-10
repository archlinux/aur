# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=113
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('df960cdb44046206132d5ee5d53a8dc947bbf25f9ca55eda9e788e27fed3582c')

build() {
  cd "${_pkgbase}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgbase}-v${pkgver}"
  make VERSION=${pkgver} DESTDIR=${pkgdir} install
}
