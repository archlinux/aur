# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=cadubi
pkgver=1.3
pkgrel=2
pkgdesc="A terminal application to draw text-based images"
arch=('any')
url="http://langworth.com/pub/cadubi/"
license=('GPL' 'PerlArtistic')
depends=('perl-term-readkey')
source=("ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz")
sha256sums=('ca8b6ea305e0eccb11add7fc165beeee7ef33f9f0106e84efa1b364f082df0ab')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed 's|$Bin/help.txt|/usr/share/cadubi/help.txt|g' -i cadubi
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/cadubi/cadubi "$pkgdir/usr/bin/cadubi"

  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 cadubi "$pkgdir/usr/share/cadubi/cadubi"
  install -D -m 0755 help.txt "$pkgdir/usr/share/cadubi/help.txt"
}

# vim:set ts=2 sw=2 et:
