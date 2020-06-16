# Maintainer:  Harry Cheng <chengyuhui1 at gmail dot com>

pkgname=ntfs-3g-onedrive-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="NTFS-3G plugin for reading OneDrive directories created by Windows 10"
arch=("x86_64")
url="https://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html"
license=("GPL2")
depends=("ntfs-3g")
source=("https://jp-andre.pagesperso-orange.fr/onedrive.zip")
sha256sums=("c18de9c41596fc34dde48ec8193c733d49a607cd3ecf7213697ab6dc347461d9")

package() {
	cd "$srcdir/onedrive"

  install -Dm0555 linux-64/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000001a.so"
  ln -s /usr/lib/ntfs-3g/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000301a.so"
  ln -s /usr/lib/ntfs-3g/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000601a.so"
  ln -s /usr/lib/ntfs-3g/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000701a.so"
  
	install -Dm644 readme "$pkgdir/usr/share/doc/$pkgname/README"
}