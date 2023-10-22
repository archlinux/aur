# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
_pkgname=dash-to-dock-ubuntu-dock
pkgver=87ubuntu2
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
sha256sums=('65e5b3739d2eee1e12190a43ea05cd38fef22ce6ecec86550bf81f557e254b9b')

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" VERSION="$pkgver" install
}
