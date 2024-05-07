# Maintainer: Teal Penguin <_penguin at tuta dot io>

_pkgname=openweatherrefined
pkgname=gnome-shell-extension-openweatherrefined
pkgver=135
pkgrel=1
pkgdesc="Display weather for the current or a specified location in the GNOME shell"
arch=('any')
url="https://github.com/penguin-teal/gnome-openweather"
license=('GPL-3.0-or-later')
depends=('dconf' 'gnome-shell')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d54bd39004bc458224032c2ff74038890b89fb8d2fe1ceefce2a3ee165d4592')

build() {
  cd "gnome-openweather-${pkgver}"
  make
}

package() {
  cd "gnome-openweather-${pkgver}"
  make DESTDIR=${pkgdir} install
}
