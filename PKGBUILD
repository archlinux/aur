#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=hexgrep
pkgver=2013.9.6
pkgrel=1
pkgdesc='versatile grep-like binary stream and file search tool'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/hexgrep"
source=(
  http://xyne.archlinux.ca/projects/hexgrep/src/hexgrep-2013.9.6.tar.xz
  http://xyne.archlinux.ca/projects/hexgrep/src/hexgrep-2013.9.6.tar.xz.sig
)
sha512sums=(
  d6a6e2062176fd32404e27318cb1dd463579d2112e26feef487e6ffbfd8baf11d39b44a940ea11256819b99b411c3e191e76c4e3cac482340c71b4a9078ddd61
  dbab948d6fd37062ec4ecab056b44f5360fb9edbe39dcb79f324d11f348af0ffad9e1e65ac15b2f91a445de92d829a16c89e208fef172468bb62fdb7205a88af
)
md5sums=(
  0550b56796ca5c14e3c825b6c68b9aa0
  13f8d1702c6c5ceb6b405a862102fe7a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make
}

package ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 "man/hexgrep.1.gz" "$pkgdir/usr/share/man/man1/hexgrep.1.gz"
}

# vim: set ts=2 sw=2 et:
