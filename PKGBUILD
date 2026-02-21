# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='podman_backup'
pkgname=('podman_backup' 'podman_backup-debug')
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.4.2'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.4.2.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.2/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.2/binaries-linux-debug-symbols.tar.xz")
b2sums=('dc4e695f86b7666aa516fa5a9691d6c90669c321a45dda826cec7a9dd0d9a0e8e021b5e27d11e44874c8e609b20b00d0240cdd3959c7dce6dbccad0f90cc2512'
        'c7e057c2bc29c007986b433c2881b5f152d7ab7dfb55a465fe70a816629b4a6c3acef47076cbed771dff2bf55a8254cc99355758d52c5e49a6895b087c785555'
        '86a87413e5859032fa49b55e46f09f3fddfa08be227846aba173cfd5c18f5967c57d2c21b9c1d03a5d78d6885acff5b4e6b35c4bc6a6c20a6dbb93ca3ca8c348')
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

