# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=libvss
epoch=1
pkgver=23.0.0
pkgrel=1

pkgdesc="A high level string and text processing library for Ada."
url="https://github.com/AdaCore/VSS"

arch=('i686' 'x86_64')
license=('Apache')

makedepends=('gprbuild')
         
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(94f782d629c2817ae3755461fa8f813a00c8576e91388606bc772ff708efec28)

build()
{
   cd "$srcdir/VSS-$pkgver"
   make all
}

package()
{
   cd "$srcdir/VSS-$pkgver"

   make DESTDIR=$pkgdir install

   # Install the license.
   install -D -m644     \
      "LICENSE"         \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
