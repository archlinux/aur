# Maintainer: libele <libele@disroot.org>

_pkgname=inform6lib
pkgname=inform-stdlib
pkgver=6.12.8
pkgrel=2
pkgdesc="Inform 6 standard library"
arch=('any')
url="https://gitlab.com/DavidGriffith/inform6lib"
license=('Artistic2.0')
groups=('inform')
source=("https://gitlab.com/DavidGriffith/inform6lib/-/archive/$pkgver/inform6lib-$pkgver.tar.gz")
sha256sums=('9c48e1f59240a5e07b0d3a0cdd843619ed8e4926c2ea0cbff88484048e203601')

package() {
  install -vdm755 "$pkgdir/usr/share/$pkgname"
  cp -r "$_pkgname-$pkgver/"*.h "$pkgdir/usr/share/$pkgname"

  cd "$pkgdir/usr/share/$pkgname"
  ln -s english.h "$pkgdir/usr/share/$pkgname/English.h"
  ln -s grammar.h "$pkgdir/usr/share/$pkgname/Grammar.h"
  ln -s parser.h "$pkgdir/usr/share/$pkgname/Parser.h"
  ln -s verblib.h "$pkgdir/usr/share/$pkgname/Verblib.h"
  ln -s verblib.h "$pkgdir/usr/share/$pkgname/VerbLib.h"

  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 caveats.txt "$pkgdir/usr/share/$pkgname/caveats.txt"
  install -Dm644 voices_and_tenses.txt "$pkgdir/usr/share/$pkgname/voices_and_tenses.txt"

  install -Dm644 ARTISTIC "$pkgdir/usr/share/licenses/$pkgname/ARTISTIC"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
