# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-fuzzy-app-search-git
pkgver=5.1.0.r3.gb94e37b
pkgrel=1
pkgdesc="Fuzzy application search results for Gnome Search"
arch=('any')
url="https://gitlab.com/Czarlie/gnome-fuzzy-app-search"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-fuzzy-app-search')
source=('git+https://gitlab.com/Czarlie/gnome-fuzzy-app-search.git')
sha256sums=('SKIP')

pkgver() {
  cd gnome-fuzzy-app-search
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gnome-fuzzy-app-search
  make build
}

package() {
  cd gnome-fuzzy-app-search
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}
