# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='podman_backup'
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.4.4'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("${pkgname}-${pkgver}-sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.4.4.tar.gz"
        "${pkgname}-${pkgver}-linux.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.4/podman_backup-1.4.4-linux.tar.xz")
b2sums=('a309fbe504c538e9c93102c992310d3129d759575385f0a2012cfa2a1987789fb2f3ea765215fea64432da8ca842d1d761551a461484e0c99375b4bc37eed31a'
        '6e6e30479dfc2190a2abcc91f83fe2d15e52c54521b5c5741afd76f5da7faf8ee3d00e29e8b5e0875e54703280043688c5c5daf4356ead75106d2829780f1153')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir='podman_backup-1.4.4'

package_podman_backup() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a 'podman_backup-1.4.4/.' "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/"'podman-backup' "$pkgdir/usr/bin/"'podman-backup'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

