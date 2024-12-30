# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='podman_backup'
pkgname=('podman_backup' 'podman_backup-debug')
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.3.4'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.3.4.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.3.4/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.3.4/binaries-linux-debug-symbols.tar.xz")
b2sums=('2e1aa46dfbb35260d03052ec2739ced8a670a12f882dce680f1e26f32f4124f2748899d95496a3b38a92340499064cea579bf5b4429292f2c58a502e38e73021'
        '19ec2390d5e8634a23182a8187ef3089821b4f5cac8e4e36528935aa491ba5669817d1c0f35264c9a9ad952dbf8e84bd84df4c799a37a4b25ce1c2ce94bceed4'
        'e46e37ae72ff5cc741e083b5f5fe488554a8518b69a104b4c602646df685ac8baaae11dc489f5371dd5245ca80eb974a368cd36a5aac3134dd5618e4d0ed6657')
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

