pkgname=scbackup
pkgver=0
pkgrel=1
arch=('x86_64')
pkgdesc="Soundcloud backupper"
url="https://azopcorp.com/blog/scbackup"
license=('custom:free')
depends=('libxtst' 'libxss' 'nss' 'gconf' 'gtk2' 'alsa-lib')
source=("mega://scbackup-linux-x64.tar.gz")
sha512sums=('3754d0dffb7c42b9a3a9110ab1e73e69c9173cbd54debfb34412d07c8d8c6358eacca444e310e77678282858b7c0cd7dbf7c9f9e8a5605d8472cfb26065865f8')
DLAGENTS+=('mega::/usr/bin/echo "Could not find %u. Manually download it from https://mega.nz/#!PQ4UnbDY!YOAH9JxpUyiqfaaVjxpcb1DRpgyruBMP2cWvDxBJfpk to $pwd"')

package() {
    install -Dm755 "$srcdir/scbackup-linux-x64/scbackup" "$pkgdir/usr/bin/scbackup"
    install -Dm644 "$srcdir/scbackup-linux-x64/libffmpeg.so" "$pkgdir/usr/lib/libffmpeg.so"
    install -Dm644 "$srcdir/scbackup-linux-x64/libnode.so" "$pkgdir/usr/lib/libnode.so"
    install -Dm644 "$srcdir/scbackup-linux-x64/LICENSE"  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

