# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_pkgname=openweather
pkgname=gnome-shell-extension-openweather
pkgver=117
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Shell"
arch=('any')
url="https://gitlab.com/skrewball/openweather"
license=('GPL3')
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('08779663c74302a8f059e7f2d0afe5e2dc27d7f73a35893339b28b57e1f6bf55')

build() {
  cd "${_pkgname}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgname}-v${pkgver}"
  make DESTDIR=${pkgdir} install
}
