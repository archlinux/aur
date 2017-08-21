#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=synclinks
pkgver=2017
pkgrel=1
pkgdesc='A tool that synchronizes hierarchies of symlinks.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.archlinux.ca/projects/synclinks"
depends=(glibc)
source=(
  https://xyne.archlinux.ca/projects/synclinks/src/synclinks-2017.tar.xz
  https://xyne.archlinux.ca/projects/synclinks/src/synclinks-2017.tar.xz.sig
)
sha512sums=(
  a1913ff7d18ced042b204161c1fd6e93a83a6c385383577844c588eda7781b736df5fc322e23c6f0de306c439e529a1c464ae9dbe1cacb627f48184a80ee3223
  b9ae205cfe370feb1dc78600a1964e79020e826bb6d593738794dd7e67ad647a101ccc5669550cc910bba7f3a3e98e9c81d0268243467cc85e4b57b157918242
)
md5sums=(
  baad1249eef7be6f8b7a1644520a8a6b
  dc051f763621f491950d5509fb50d376
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
}

# vim: set ts=2 sw=2 et:
