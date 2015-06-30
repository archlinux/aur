# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libreboot
pkgver=20150208
pkgrel=2
pkgdesc="A free BIOS/UEFI replacement for your computer"
arch=('x86_64' 'i686' 'armv7l')
url="http://libreboot.org"
license=(GPL)
provides=('libreboot')
source=("http://www.mirrorservice.org/sites/libreboot.org/release/$pkgver/libreboot_bin.tar.xz") 
sha256sums=('21649115f15b49657e8232337ed996aed5ef5a6e48412fbf834b83f996472f01')


package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/libreboot_bin/cbfstool/$CARCH/cbfstool" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/libreboot_bin/cbfstool/$CARCH/rmodtool" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/libreboot_bin/flashrom/$CARCH/flashrom" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/libreboot_bin/ich9deblob/$CARCH/ich9deblob" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/libreboot_bin/ich9deblob/$CARCH/ich9gen" "$pkgdir/usr/bin/"
  if [ $CARCH != "armv7l" ]; then
    install -Dm755 "$srcdir/libreboot_bin/bucts/$CARCH/bucts" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/libreboot_bin/cbmem/$CARCH/cbmem" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/libreboot_bin/nvramtool/$CARCH/nvramtool" "$pkgdir/usr/bin/"
  fi
}

# vim:set ts=2 sw=2 et:
