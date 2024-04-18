# Maintainer: Teal Penguin <_penguin at tuta dot io>

_pkgname=openweatherrefined
pkgname=gnome-shell-extension-openweatherrefined
pkgver=134
pkgrel=1
pkgdesc="Display weather for the current or a specified location in the GNOME shell"
arch=('any')
url="https://github.com/penguin-teal/gnome-openweather"
license=('GPL-3.0-or-later')
depends=('dconf' 'gnome-shell')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e59e0b8ed2ea9708084f10bc60cebbda0b1e28a5e0479bac780e36b25ea46692')

build() {
  cd "gnome-openweather-${pkgver}"
  make
}

package() {
  cd "gnome-openweather-${pkgver}"
  make DESTDIR=${pkgdir} install
}
