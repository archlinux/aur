# Maintainer: Nintend0d0 <nintend0d0 at aholic dot ch>

pkgname="devsy-desktop-deb-bin"
pkgver=1.23.2
pkgrel=1
pkgdesc="Enables teams to scale development using standardized workspaces."
arch=("x86_64")
url="https://github.com/devsy-org/devsy"
license=("MPL-2.0")

depends=(
  "gtk3" # deb: libgtk-3-0
  "libnotify" # deb: libnotify4
  "nss" # deb: libnss3
  "libxss" # deb: libxss1
  "libxtst" # deb: libxtst6
  "xdg-utils" # deb: xdg-utils
  "at-spi2-core" # deb: libatspi2.0-0
  "util-linux-libs" # deb: libuuid1
)

optdepends=(
  "libappindicator: Display tray icon" # deb: libappindicator3-1
)

provides=("devsy-desktop")

source=(
  "devsy-desktop-$pkgver-$arch.deb::https://github.com/devsy-org/devsy/releases/download/v$pkgver/Devsy_linux_amd64.deb"
)
sha256sums=("5486936154baf0fa32ed26a8c007b2b908db9b7e9f1e415fdd60359a86d767ba")

package() {
  bsdtar -x -f "$srcdir/data.tar.xz" -C "$pkgdir"
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Devsy/devsy-desktop" "$pkgdir/usr/bin/."
}
