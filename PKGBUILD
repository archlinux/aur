# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
_pkgname=dash-to-dock-ubuntu-dock
pkgver=72_ubuntu5
pkgrel=1
pkgdesc="A dock for the Gnome Shell, default Ubuntu experience"
arch=('any')
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
license=('GPL')
depends=('gnome-shell')
makedepends=('gettext' 'intltool' 'sassc')
provides=('gnome-shell-extension-dash-to-dock' 'gnome-shell-extension-dash-to-dock-git')
conflicts=('gnome-shell-extension-dash-to-dock' 'gnome-shell-extension-dash-to-dock-git')
source=("https://github.com/micheleg/dash-to-dock/archive/ubuntu-dock-$pkgver.tar.gz")
sha256sums=('d00808775c6b992a601af2b651009069f58f4892af118173e2d755aa6d3a2abd')

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" VERSION="$pkgver" install
}
