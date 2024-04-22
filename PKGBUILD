# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='podman_backup'
pkgname=('podman_backup' 'podman_backup-debug')
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.3.2'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.3.2.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.3.2/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.3.2/binaries-linux-debug-symbols.tar.xz")
b2sums=('4e64d009e706007d3700671d456711db91b7f18ef7b363b4216b256f584388c2e96f10f6eea0a50c6909de5d4b890fbeee01478c0e35a39a8c3fb6ebdadc57e4'
        'e1283dd583421814020459a001b78a1746db4c7bc46b60290e7dc7e932f1745e855d80c885f70b4a2a2b0325d37ebadd7ca8c4e7ffcd2a3d4b643994b89a1ee1'
        '58acab6b2e102b4ddb49c979a34157f45f9f83feecf7c27e2e1fa29a8ee74d11f69b794063bb0d961be3372c5b016cead3bf30da22767ec06a07150a922b25b2')
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

