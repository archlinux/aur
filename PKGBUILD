# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='podman_backup'
pkgname=('podman_backup' 'podman_backup-debug')
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.4.1'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.4.1.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.1/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.1/binaries-linux-debug-symbols.tar.xz")
b2sums=('5eb9a4dfa166815455d8ee71780daf35261169ed4b79c1d5385d0be7840f460080c7b4788e7df2a646a1e25b532d044b9cd4b36191c3df377e31cae57e1d1a74'
        'bebfa12ea634be64f2ace061f9d548e93b6c7e2f47b5dbd1a5c3d3ddd819c4e2bcfd1219859a0d21a49b017864c90325ac48bdc4be86dc2cd22d101bc17a2362'
        '4dd6ade7b5dbcecc564689bae61c38817bf8fe76cfa496b5093cb845ea98c79e20458488d00530a0ef57a323571ca09203efe497d899783e12a20cfec12ed663')
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

