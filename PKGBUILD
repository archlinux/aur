# Contributor: tee < teeaur at duck dot com >
pkgname=qbittorrent-enhanced-nox-bin
pkgver=5.2.1.10
pkgrel=1
pkgdesc="A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL-3.0-or-later AND custom')
provides=('qbittorrent-nox')
conflicts=('qbittorrent-nox')
source=(
  "$pkgname-$pkgver.zip::$url/releases/download/release-$pkgver/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"
  "$url/raw/v5_2_x/COPYING"
  "$url/raw/v5_2_x/COPYING.GPLv3"
  "$url/raw/v5_2_x/dist/unix/org.qbittorrent.qBittorrent.desktop"
  "qbittorrent-nox.service"
  "qbittorrent-nox@.service"
  "qbittorrent-nox.sysusers"
  "qbittorrent-nox.tmpfiles"
)
sha256sums=('0460ccaa358ad28019a79424f17863093b770a8987df52fed153f35bb9aa7223'
            'e675cd856f9817474455200ba7e6f5b7cc42d6598a5eecbbbdaa0e6fd304d6b7'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '1b74d8390303c6018adce711f6c9df2cc5b53be0bd3d4cf9aac5aafeac80c9b5'
            '1abf767c45501f987dbac764186f7bce51da11b09efed9e0ac9d52258828af28'
            '05fed0075716b556dfdfb39d811a2d9a2e3daabcae3f3a3d15947d15e86013c4'
            '4d7b6b7b60390043f57d8a1efcf7c4056ff0c1f6dc833159505eeb05a5de86d3'
            '6fc0057b9bfa88d77db962885395e22bf5abc6625c908db4cb773b29e56afc9a')

package() {
  sed -i 's/qbittorrent/qbittorrent-nox/gi' org.qbittorrent.qBittorrent.desktop 
  install -Dm755 qbittorrent-nox "$pkgdir"/usr/bin/qbittorrent-nox
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYING.GPLv3 "$pkgdir"/usr/share/licenses/$pkgname/COPYING.GPLv3
  install -Dm644 org.qbittorrent.qBittorrent.desktop "$pkgdir"/usr/share/applications/org.qbittorrent.qBittorrent-nox.desktop
  install -Dm644 qbittorrent-nox.service "$pkgdir"/usr/lib/systemd/system/qbittorrent-nox.service
  install -Dm644 qbittorrent-nox@.service "$pkgdir"/usr/lib/systemd/system/qbittorrent-nox@.service
  install -Dm644 qbittorrent-nox.sysusers "$pkgdir"/usr/lib/sysusers.d/qbittorrent-nox.conf
  install -Dm644 qbittorrent-nox.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/qbittorrent-nox.conf
}
