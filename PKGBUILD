# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libreboot
pkgver=20160907
pkgrel=1
pkgdesc="A free BIOS/UEFI replacement for your computer"
arch=('x86_64' 'i686' 'armv7l')
url="http://libreboot.org"
license=(GPL)
provides=('libreboot')
source=("http://www.mirrorservice.org/sites/libreboot.org/release/stable/${pkgver}/libreboot_r${pkgver}_util.tar.xz")
sha256sums=('4185e6244fc3a37859be91eb60bfbeb7bdb527c7d00cfb2a60008fab2cbf9611')
_dirname="libreboot_r${pkgver}_util"

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/$_dirname/cbfstool/$CARCH/cbfstool" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/$_dirname/flashrom/$CARCH/flashrom" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/$_dirname/ich9deblob/$CARCH/ich9deblob" "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/$_dirname/ich9deblob/$CARCH/ich9gen" "$pkgdir/usr/bin/"
  if [ $CARCH != "armv7l" ]; then
    install -Dm755 "$srcdir/$_dirname/bucts/$CARCH/bucts" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/$_dirname/nvramtool/$CARCH/nvramtool" "$pkgdir/usr/bin/"
  fi
}

# vim:set ts=2 sw=2 et:
