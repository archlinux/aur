# Maintainer: SraamaR <sraamar dot psplus at gmail dot com>

# Contributor: Tomas Jasek <tomsik68 at gmail dot com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Gabriel Guldner <gabriel at guldner dot eu>

pkgname='papyrus'
pkgver='7.0.0'
pkgrel=1
pkgdesc='Graphical editing tool for UML based on eclipse.'
arch=('x86_64')
url='http://www.eclipse.org/papyrus/'
license=('EPL')
options=('!strip')
groups=()
depends=(python perl bash)
makedepends=(tar)
provides=('papyrus')
conflicts=('papyrus')
sha256sums=('6a961f8b6559bffc630a1004fce1d4d0a18b4e01b641a75eabfd69b05b5705ef'
            '0bf0ff5eacc3e955a01c171cc21d8c989707ed9eee668ce176d67cfae06c8608'
            '255f1d8b0277bb9e4a3f84d09294fe34a54485b29f67220733343f37db052b94'
            '08717c9d6b98685ae13e1fb4c509872d88c9b49192e7f5f44d379b2edabe1e24')
source=(
  "https://www.eclipse.org/downloads/download.php?file=/modeling/mdt/papyrus/papyrus-desktop/rcp/2025-06/7.0.0/papyrus-desktop-2025-06-7.0.0-linux.gtk.x86_64.tar.gz&r=1"
  "papyrus.png"
  "papyrus.desktop"
  "papyrus"
)

build() {
  cd "$srcdir/Papyrus"
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/lib/papyrus"
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/icons"
  mkdir -p "$pkgdir/usr/share/applications"

  install -m644 papyrus.png "$pkgdir/usr/share/icons/"
  install -m755 papyrus.desktop "$pkgdir/usr/share/applications/"

  cd "$srcdir/Papyrus"
  find . -type f -exec install -vDm755 {} "$pkgdir/usr/lib/papyrus/"{} \;

  install -m755 "$srcdir/papyrus" "$pkgdir/usr/bin/papyrus"
}
