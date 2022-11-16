# Maintainer: Tom Zander

pkgname=borg-backup
pkgver=0.6
pkgrel=1
pkgdesc="Add multi-machine sync to borg"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('qt5-base' 'borg')
source=("git+https://codeberg.org/zander/borgBackup.git#branch=master")
sha256sums=("SKIP")

build() {
  cd borg-backup
  qmake
  make all install
}

package() {
  install -Dm 755 "borg-backup/backup" -t "$pkgdir/usr/bin"
}
