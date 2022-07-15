#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=hexgrep
pkgver=2013.9.6
pkgrel=4
pkgdesc='versatile grep-like binary stream and file search tool'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.dev/projects/hexgrep"
source=(
  https://xyne.dev/projects/hexgrep/src/hexgrep-2013.9.6.tar.xz
  https://xyne.dev/projects/hexgrep/src/hexgrep-2013.9.6.tar.xz.sig
)
sha512sums=(
  d6a6e2062176fd32404e27318cb1dd463579d2112e26feef487e6ffbfd8baf11d39b44a940ea11256819b99b411c3e191e76c4e3cac482340c71b4a9078ddd61
  4a7146f5ab1839ce1613ebbbd244dab4925ba69b925382cf3c603aa59c03d748a6ca24ad65378890e8ef1ec8dc93b84ddba03e0f80d69b787e6d380ea0a2e824
)
md5sums=(
  0550b56796ca5c14e3c825b6c68b9aa0
  e6a7a5c928381275c088d95a05ae482a
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
