# Maintainer:  Harry Cheng <chengyuhui1 at gmail dot com>

pkgname=ntfs-3g-onedrive-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="NTFS-3G plugin for reading OneDrive directories created by Windows 10"
arch=("x86_64")
url="https://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html"
license=("GPL2")
depends=("ntfs-3g")
source=("https://jp-andre.pagesperso-orange.fr/onedrive.zip")
sha256sums=("fd5e1b7d58d2590254de176654e7c2b90340dde904ecd2e8640c30bc6b9e6684")

package() {
	cd "$srcdir/onedrive"

  install -Dm0555 linux-64/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000001a.so"
  ln -s /usr/lib/ntfs-3g/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000301a.so"
  ln -s /usr/lib/ntfs-3g/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000601a.so"
  ln -s /usr/lib/ntfs-3g/ntfs-plugin-9000001a.so "$pkgdir/usr/lib/ntfs-3g/ntfs-plugin-9000701a.so"
  
	install -Dm644 readme "$pkgdir/usr/share/doc/$pkgname/README"
}