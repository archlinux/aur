# Maintainer: donydaily
pkgname=oplmgr-git
pkgver=r2.48d4aef
pkgrel=1
pkgdesc="CLI PS2 OPL Manager / USBUtil alternative for Linux (git)"
arch=('any')
url="https://github.com/donydaily/oplmgr"
license=('MIT')

depends=(
  'bash'
  'coreutils'
  'util-linux'
  'awk'
  'sed'
  'grep'
  'pv'
  'p7zip'
  'curl'
)

provides=('oplmgr')
conflicts=('oplmgr')

source=("git+https://github.com/donydaily/oplmgr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/oplmgr"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/oplmgr"

  install -Dm755 oplmgr "$pkgdir/usr/bin/oplmgr"
  install -Dm644 README.md "$pkgdir/usr/share/doc/oplmgr/README.md"
}
