# Maintainer: Amanoel Dawod <amanoel at outlook dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
_pkgname=dash-to-dock-ubuntu-dock
pkgver=66ubuntu19.10.2
pkgrel=1
pkgdesc="A dock for the Gnome Shell, default Ubuntu experience"
arch=('any')
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext')
source=("https://github.com/micheleg/dash-to-dock/archive/ubuntu-dock-$pkgver.tar.gz")
sha256sums=('e5d8f50b26422e26c71d5a906b6e72a553e09bcee21bad8e6796055b294bcfa5')

build() {
  cd ${_pkgname}-${pkgver}
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
