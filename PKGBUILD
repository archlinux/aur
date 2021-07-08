# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
_pkgname=dash-to-dock-ubuntu-dock
pkgver=70_ubuntu1
pkgrel=1
pkgdesc="A dock for the Gnome Shell, default Ubuntu experience"
arch=('any')
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
license=('GPL')
depends=('gnome-shell')
makedepends=('gettext' 'intltool' 'sassc')
source=("https://github.com/micheleg/dash-to-dock/archive/ubuntu-dock-$pkgver.tar.gz")
sha256sums=('4edd91d71178e058038963ab4002c21f90f7fb748b5a409fdfea759ae79627f5')

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" VERSION="$pkgver" install
}
