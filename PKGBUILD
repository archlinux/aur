#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=maown
pkgver=2021
pkgrel=1
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
  74de3e3c0ec61cc17b56f4776f782d4aaefe1d472f7c2e2bd8de42920678964d1104718d5ef8534ab06abb65a0b013b72967fcce4936f94baf9423a5c3d50726
)
md5sums=(
  279a6095df026dbcf1ac5099289f2271
  13ab656f6d0468de92e09e8fb26c6df5
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

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
