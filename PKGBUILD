# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=rufix
pkgver=0.1.1
pkgrel=1
pkgdesc="Rufus-style USB formatter and bootable drive creator for Linux (GTK3)"
arch=('any')
url="https://github.com/thuutien/rufix"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk3' 'polkit'
         'dosfstools' 'e2fsprogs' 'exfatprogs' 'ntfs-3g'
         'util-linux' 'systemd')
optdepends=('wimlib: split Windows install.wim images larger than 4 GB for FAT32 drives'
            'parted: re-read partition tables via partprobe')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thuutien/rufix/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9315a4f664f93bafc24d89e3a0579817854959bff3bdee367371178722a1ff4d')

package() {
  cd "$pkgname-$pkgver"
  sh install.sh --prefix-root "$pkgdir"
}
