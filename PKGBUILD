# Maintainer: Amanoel Dawod <amanoel at outlook dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
pkgver=64ubuntu3
pkgrel=1
pkgdesc="A dock for the Gnome Shell"
arch=('any')
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext')
source=("http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-shell-extension-ubuntu-dock/${pkgname}_${pkgver}.tar.xz")
sha256sums=('d8352b85dd44eabd99d91bdd81cce24e2efcd1862614aa5262c67417e985a6a0')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
