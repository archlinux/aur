#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=maown
pkgver=2012.12.24.1
pkgrel=3
pkgdesc='Monitor a shared directory and automatically adjust file ownership and permissions.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/maown"
source=(
  http://xyne.archlinux.ca/projects/maown/src/maown-2012.12.24.1.tar.xz
  http://xyne.archlinux.ca/projects/maown/src/maown-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  be0194a384f1b711d1cdfa353a993e25422a62de2b5db730623f387a612ea2a4912f6fab4d65a1f93a8c6809dff497c05e63246a6e215ac30dfe21007af6095c
  b32935713f460d23d8b2014a955f14487f8a382535de903a1fc8da56a60251d5e68f3697d40568a43242e755a43609dd97c41bd7a9d3bfe4ae25a25f0189e1f8
)
md5sums=(
  55b24bf46c07282796e696f99b00b07d
  038e936c1ff076fbf57b9f1e49e8dd14
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
