#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=synclinks
pkgver=2017.8
pkgrel=1
pkgdesc='A tool that synchronizes hierarchies of symlinks.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.archlinux.ca/projects/synclinks"
depends=(glibc)
source=(
  https://xyne.archlinux.ca/projects/synclinks/src/synclinks-2017.8.tar.xz
  https://xyne.archlinux.ca/projects/synclinks/src/synclinks-2017.8.tar.xz.sig
)
sha512sums=(
  59c99832ab2c9e3c789cc267c7a81cd97379d3813b43a1fc99db35dc8eb5eb24a83ebda03741a79a9313643ea72342d6583d922e9a56e9ba742b38d04555c494
  43db73eb9113908451dcabd28e267eec9579a332a34e450f1e24670fa95c948857c4b319c4b60e11ba565f00e955da1cba5a6c00da618a153adcd5c5bed6dfe9
)
md5sums=(
  22737092f6ad455ae2e59bb45a0b3ca6
  4f239248775ad2e4a1e755c0e3c9819a
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
