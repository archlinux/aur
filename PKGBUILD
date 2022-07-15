#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=synclinks
pkgver=2017.8
pkgrel=4
pkgdesc='A tool that synchronizes hierarchies of symlinks.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.dev/projects/synclinks"
depends=(glibc)
source=(
  https://xyne.dev/projects/synclinks/src/synclinks-2017.8.tar.xz
  https://xyne.dev/projects/synclinks/src/synclinks-2017.8.tar.xz.sig
)
sha512sums=(
  59c99832ab2c9e3c789cc267c7a81cd97379d3813b43a1fc99db35dc8eb5eb24a83ebda03741a79a9313643ea72342d6583d922e9a56e9ba742b38d04555c494
  9cbc1d221d9035baae056c2b7e717e637f573800c25d98eeb191d49cab95a48c3249545e601abc879a1498688cbee6799b207c0a81ce3b7dc00abbde47e6a180
)
md5sums=(
  22737092f6ad455ae2e59bb45a0b3ca6
  7bdbc0e32864204081aee5cbe9316313
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
}

# vim: set ts=2 sw=2 et:
