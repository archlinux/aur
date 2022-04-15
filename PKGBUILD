# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
_pkgname=dash-to-dock-ubuntu-dock
pkgver=72_ubuntu3
pkgrel=1
pkgdesc="A dock for the Gnome Shell, default Ubuntu experience"
arch=('any')
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
license=('GPL')
depends=('gnome-shell')
makedepends=('gettext' 'intltool' 'sassc')
source=("https://github.com/micheleg/dash-to-dock/archive/ubuntu-dock-$pkgver.tar.gz")
sha256sums=('34f2c80ec34adbe7e918e7a1b6a514d39432c7b75e36139d1e2ee07bbfe64bf4')

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" VERSION="$pkgver" install
}
