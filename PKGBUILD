#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=maown
pkgver=2016
pkgrel=1
pkgdesc='Monitor a shared directory and automatically adjust file ownership and permissions.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/maown"
source=(
  http://xyne.archlinux.ca/projects/maown/src/maown-2016.tar.xz
  http://xyne.archlinux.ca/projects/maown/src/maown-2016.tar.xz.sig
)
sha512sums=(
  8da3bf533f860321233e7073d915168945ff199e5f180592383ebdad87707b3672b382e9e6bf02b9d4ebca39146217b22294cfdc2f87445cdc3fe329ca27cecc
  923dbc95d72c824a5a68665d24ab9511809a6d1a969ab3ae6948b39c965a10e076d6ee1fc02b7e224a95bef36f69e535ca240d17265421f2e3ebaecce61f3d7e
)
md5sums=(
  1f5e5cc864cb11b8b38e654483cbcc2e
  1a6c3ca813c6cb6e1db686eb571f9890
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
