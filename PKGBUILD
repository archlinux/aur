# Maintainer: Teal Penguin <_penguin at tuta dot io>

_pkgname=openweatherrefined
pkgname=gnome-shell-extension-openweatherrefined
pkgver=123
pkgrel=1
pkgdesc="Display weather for the current or a specified location in the GNOME shell"
arch=('any')
url="https://github.com/penguin-teal/gnome-openweather"
license=('GPL-3.0-or-later')
depends=('dconf' 'gnome-shell')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3399f9cb7d8093949db7229974b1b3220234d661adbaf19318d52e30a97c949')

build() {
  cd "gnome-openweather-${pkgver}"
  make
}

package() {
  cd "gnome-openweather-${pkgver}"
  make DESTDIR=${pkgdir} install
}
