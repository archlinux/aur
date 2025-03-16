# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='podman_backup'
pkgname=('podman_backup' 'podman_backup-debug')
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.3.5'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.3.5.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.3.5/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.3.5/binaries-linux-debug-symbols.tar.xz")
b2sums=('3af5786bea78aad8727acedfc1c9e2d29103abb0031a73c52da4456d06d8c512d799545976b83c603ed981928ab1690b64293fd48a0a38faeeab12afdf68113d'
        '9e3d9ce579777b124984d7915b53bc6289321ffacf25f3d0586c614640ba97222e8770cb2a21aa079f1aa74cf84c918791caedcad2147626cc7c8ea0ec9b6168'
        '574ef4a91622e4a35c853ce6de4e0da0eff2295bcbf8a1d835f9262950e9ae9daeaf617bf0853db6552bfa2adf098551475ab03b16eb907fbf3399d8424f15ec')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir="$pkgbase-$pkgver"

package_podman_backup() {
  install -D -m755 'podman-backup' "$pkgdir/usr/bin/"'podman-backup'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

package_podman_backup-debug() {
  install -D -m644 'podman-backup.sym' "$pkgdir/usr/lib/debug/usr/bin/"'podman-backup'.sym
  cd "$_pkgdir"
  find . -exec install -D -m644 "{}" "$pkgdir/usr/src/debug/$pkgbase/{}" \;
}

