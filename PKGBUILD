# Maintainer: NEOAPPS <asd22.info@gmail.com>
# Co-Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=obsidian-control-git
pkgver=r2.650ceea
pkgrel=1
pkgdesc="ObsidianOS Control Center"
arch=('any')
url="https://github.com/Obsidian-OS/obsidian-control"
license=('MIT')
depends=('python' 'obsidianctl' 'pyside6')
makedepends=('git')
provides=('obsidian-control')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 obsidian-control.py "$pkgdir/usr/bin/obsidian-control"
  install -Dm755 obsidian-control.desktop "$pkgdir/usr/share/applications/obsidian-control.desktop"
}
