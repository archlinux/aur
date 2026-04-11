# Maintainer: Adam Maroti <jmarotiadam@gmail.com>
# Ex-Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>

pkgname=gnome-shell-extension-ubuntu-dock
_pkgname=dash-to-dock-ubuntu-dock
pkgver=104ubuntu1
pkgrel=1
pkgdesc="A dock for the Gnome Shell, default Ubuntu experience"
arch=('any')
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
license=('GPL-2.0-or-later')
depends=('gnome-shell' 'dconf' 'gjs')
makedepends=('gettext' 'intltool' 'sassc')
provides=('gnome-shell-extension-dash-to-dock' 'gnome-shell-extension-dash-to-dock-git')
conflicts=('gnome-shell-extension-dash-to-dock' 'gnome-shell-extension-dash-to-dock-git')
source=("https://github.com/micheleg/dash-to-dock/archive/ubuntu-dock-$pkgver.tar.gz")
sha256sums=('75ee8a28c398f533684c9e1c7a33cb84a57e119fd9f237f6e4ad37eaeb9c060b')

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" VERSION="$pkgver" install
}
