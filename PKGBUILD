# Maintainer: NEOAPPS <asd22.info@gmail.com>
# Co-Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=obsidianctl
pkgver=2.0.0
pkgrel=1
pkgdesc="ObsidianOS's special program to manage A/B Partitions"
arch=('any')
url="https://github.com/Obsidian-OS/obsidianctl"
license=('MIT')
depends=('python' 'efibootmgr' 'parted' 'dosfstools' 'squashfs-tools' 'rsync' 'coreutils' 'e2fsprogs' 'systemd' 'util-linux' 'procps-ng')
makedepends=('make')
provides=('obsidianctl')
source=("https://github.com/Obsidian-OS/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('59a481a69f4968c7d6e36544731a3aa8b4f2ef8883aefddc0429dfdfe18b018b')
conflicts=("obsidianctl-git")
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 obsidianctl "$pkgdir/usr/bin/obsidianctl"
}
