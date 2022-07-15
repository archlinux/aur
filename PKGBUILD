#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=maown
pkgver=2021
pkgrel=3
pkgdesc='Monitor a shared directory and automatically adjust file ownership and permissions.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.dev/projects/maown"
source=(
  https://xyne.dev/projects/maown/src/maown-2021.tar.xz
  https://xyne.dev/projects/maown/src/maown-2021.tar.xz.sig
)
sha512sums=(
  3402be9c0bcd113cc2bf4b46941c6a0e6b9688d8480421021b5231736ed03b02800011fad14e3576543b9671856d50f88b23fe7699b702d40446786575beb93a
  30bc5dcfd5e6aaf08761096567a153e8a762408ae02923e971f82f1258e98ae5376d69f772fe3ebed64857fe5dd8253c4e875618de4e069535ca48aa801aa688
)
md5sums=(
  279a6095df026dbcf1ac5099289f2271
  b993fc4dcc4b7bfcf1835fe136b0aa76
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  gcc -O2 -o "$pkgname" "$pkgname.c"
}

package ()
{
  cd -- "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${pkgname}d.conf" "${pkgdir}/etc/${pkgname}d.conf"
  install -Dm644 "man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 "man/${pkgname}d.conf.5.gz" "${pkgdir}/usr/share/man/man5/${pkgname}d.conf.5.gz"
}

# vim: set ts=2 sw=2 et:
