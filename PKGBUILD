# Maintainer: Teal Penguin <_penguin at tuta dot io>

_pkgname=openweatherrefined
pkgname=gnome-shell-extension-openweatherrefined
pkgver=139
pkgrel=1
pkgdesc="Display weather for the current or a specified location in the GNOME shell"
arch=('any')
url="https://github.com/penguin-teal/gnome-openweather"
license=('GPL-3.0-or-later')
depends=('dconf' 'gnome-shell')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d57148b246d56cc2ce6f623995bc1c9c0a4749a2f8943314fa8bd0fc88636ffd')

build() {
  cd "gnome-openweather-${pkgver}"
  make
}

package() {
  cd "gnome-openweather-${pkgver}"
  make DESTDIR=${pkgdir} install
}
