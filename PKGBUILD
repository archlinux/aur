# Maintainer: Teal Penguin <_penguin at tuta dot io>

_pkgname=openweatherrefined
pkgname=gnome-shell-extension-openweatherrefined
pkgver=138
pkgrel=1
pkgdesc="Display weather for the current or a specified location in the GNOME shell"
arch=('any')
url="https://github.com/penguin-teal/gnome-openweather"
license=('GPL-3.0-or-later')
depends=('dconf' 'gnome-shell')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e4a5af9ae8c47f7754ac68a8b6b8c491c2c97036ff8a16e4ec336367d8ad1ca7')

build() {
  cd "gnome-openweather-${pkgver}"
  make
}

package() {
  cd "gnome-openweather-${pkgver}"
  make DESTDIR=${pkgdir} install
}
