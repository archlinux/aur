# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=rufix
pkgver=0.3.1
pkgrel=1
pkgdesc="Rufus-style USB formatter and bootable drive creator for Linux (GTK3)"
arch=('any')
url="https://github.com/thuutien/rufix"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk3' 'polkit'
         'dosfstools' 'e2fsprogs' 'exfatprogs' 'ntfs-3g' 'ntfsprogs'
         'util-linux' 'systemd')
optdepends=('wimlib: split Windows install.wim images larger than 4 GB for FAT32 drives'
            'parted: re-read partition tables via partprobe'
            '7zip: extract 7z and RAR files in Compressed file mode'
            'unrar: extract RAR files in Compressed file mode'
            'libarchive: bsdtar fallback for extracting archives'
            'udisks2: remount the drive after writing so it shows in the file manager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thuutien/rufix/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('df5ff180d01774fab1615c2df3adbf166aff2f3a6f6e1fceadd5ba6cb0aa408f')

package() {
  cd "$pkgname-$pkgver"
  sh install.sh --prefix-root "$pkgdir"
}
