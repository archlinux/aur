# Maintainer: NEOAPPS <asd22.info@gmail.com>
# Co-Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=obsidianctl
pkgver=2.0.1
pkgrel=2
pkgdesc="ObsidianOS's special program to manage A/B Partitions"
arch=('any')
url="https://github.com/Obsidian-OS/obsidianctl"
license=('MIT')
depends=('python' 'efibootmgr' 'parted' 'dosfstools' 'squashfs-tools' 'rsync' 'coreutils' 'e2fsprogs' 'systemd' 'util-linux' 'procps-ng')
makedepends=('make')
provides=('obsidianctl')
source=("https://github.com/Obsidian-OS/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7099370be3a0f7e40c34ff67e69ba23b53105bcdb5e30cae25b40548af2042d')
conflicts=("obsidianctl-git")
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 obsidianctl "$pkgdir/usr/bin/obsidianctl"
}
