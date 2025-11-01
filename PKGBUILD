# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='podman_backup'
pkgname=('podman_backup' 'podman_backup-debug')
pkgdesc='A small dart tool to push regular backups of podman volumes to a remote.'
pkgver='1.4.0'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/podman_backup'
license=('BSD')
depends=('podman' 'xz' 'systemd')
source=("sources.tar.gz::https://github.com/Skycoder42/podman_backup/archive/refs/tags/v1.4.0.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.0/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/podman_backup/releases/download/v1.4.0/binaries-linux-debug-symbols.tar.xz")
b2sums=('3dbcc5a9fa98456e94219834f7fa6508ccf157e6c8f0514e4f4fa7d3ea41e06eb547985eb4f166312103d571706fe65aec2cadc1829c45e181522b63d0baa5a2'
        '4dd4a687291f9d98ba1ff1367085a6b8e4698843dfcbb74895955033ab9833d5384781fd0d0b317ccd4418bbfdc5f3156235ec7359b60269900dfbd88c5c9d55'
        'c0e03295f0724a66b252ce22b7e0c03beaffbc4bae51b4d74774e8ee699b16068804ddeccc99034c0c1ab83b6758df9e926df6193a5859ab54ad899e103cef89')
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

