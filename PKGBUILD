# Maintainer: tritonas00 <tritonas00@gmail.com>
pkgname=system-tar-and-restore
pkgver=7.0
pkgrel=1
pkgdesc='Backup and Restore your system using tar or Transfer it with rsync'
arch=('any')
license=('GPL')
depends=('rsync' 'wget')
optdepends=('gtkdialog: GUI wrapper' 'grub: Grub support' 'dosfstools: UEFI support' 'efibootmgr: UEFI support'
            'syslinux: Syslinux support' 'gptfdisk: GPT with Syslinux support' 'pigz: multicore compression' 'pbzip2: multicore compression'
            'pxz: multicore compression')
url="https://github.com/tritonas00/system-tar-and-restore"
source=("https://github.com/tritonas00/system-tar-and-restore/archive/$pkgver.tar.gz")

md5sums=('e91e228ed280d5a5d9dc3f9261e217c6')

install=readme.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 star.sh "$pkgdir/usr/bin/star.sh"
  install -Dm755 star-gui.sh "$pkgdir/usr/bin/star-gui.sh"
  install -Dm755 backup.conf "$pkgdir/usr/share/system-tar-and-restore/backup.conf"
  install -Dm755 changelog "$pkgdir/usr/share/system-tar-and-restore/changelog"
  install -Dm755 pms/system-tar-and-restore.desktop "$pkgdir/usr/share/applications/system-tar-and-restore.desktop"
  install -Dm755 pms/org.freedesktop.star-gui.policy "$pkgdir/usr/share/polkit-1/actions/org.freedesktop.star-gui.policy"
}