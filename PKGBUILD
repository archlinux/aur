# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=111
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('cc6996d47e2ae8492b32bef035c8d4aafaba1956544c4f33d1a3e34c05c3c736')

build() {
  cd "${_pkgbase}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgbase}-v${pkgver}"
  make VERSION=${pkgver} DESTDIR=${pkgdir} install
}
