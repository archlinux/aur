# Maintainer: NEOAPPS <asd22.info@gmail.com>
# Co-Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=obsidianctl
pkgver=3.0.0
pkgrel=0
pkgdesc="ObsidianOS's special program to manage A/B Partitions"
arch=('any')
url="https://github.com/Obsidian-OS/obsidianctl"
license=('MIT')
depends=('python' 'efibootmgr' 'parted' 'dosfstools' 'squashfs-tools' 'rsync' 'coreutils' 'e2fsprogs' 'systemd' 'util-linux' 'procps-ng')
makedepends=('make')
provides=('obsidianctl')
source=("https://github.com/Obsidian-OS/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acb807a61b686f3443660c4e1f80cec5b9930f5c2aa92c923635c7c9d9d8a488')
conflicts=("obsidianctl-git")
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 obsidianctl "$pkgdir/usr/bin/obsidianctl"
}
