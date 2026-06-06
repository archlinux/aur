# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='podman_backup'
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.4.3'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("${pkgname}-${pkgver}-sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.4.3.tar.gz"
        "${pkgname}-${pkgver}-linux.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.3/podman_backup-1.4.3-linux.tar.xz")
b2sums=('66a864ea6220ffa54a43182b09a343caa2ff8a4778447aea0380ccd6a23709da5df32f389331ba4f9ef11f4867ba881741a44d0e60cc65ea7a3751e48a6d6e71'
        '1bf9b263545a8287174bfd641c0df1a3433b5fde50a500b74218c176b713ba346a38bb3db79db5a9fde25a4c23e8dbc6fc3d7e34c6642c2b57cbf96d0242766c')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir='podman_backup-1.4.3'

package_podman_backup() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a 'podman_backup-1.4.3/.' "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/"'podman-backup' "$pkgdir/usr/bin/"'podman-backup'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

