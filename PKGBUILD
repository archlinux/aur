#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=maown
pkgver=2015
pkgrel=1
pkgdesc='Monitor a shared directory and automatically adjust file ownership and permissions.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/maown"
source=(
  http://xyne.archlinux.ca/projects/maown/src/maown-2015.tar.xz
  http://xyne.archlinux.ca/projects/maown/src/maown-2015.tar.xz.sig
)
sha512sums=(
  3236b776bc7368d955bfd7b5b44eee97f5f78748cbbbb48bdc47fb4cdad8cf1dc7865c98a228fd6f6a29487de0bf6156657967427e0db604d7d6f98972b8b87e
  d94d580f51ce8e9ead521da5d13be6783ecea75c30af3444f10b41373194b27bed489b1cef20e8fd4b423c12e4f2e5cedce54aad459e92e90b3a36faa902e537
)
md5sums=(
  8405415c90d1ae4e3198203e64290e81
  8a60c3f08da526d5c8007e7063578dff
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
