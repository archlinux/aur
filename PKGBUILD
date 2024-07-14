# Maintainer: libele <libele@disroot.org>

_pkgname=inform6lib
pkgname=inform-stdlib
pkgver=6.12.7
pkgrel=1
pkgdesc="Inform 6 standard library"
arch=('any')
url="https://gitlab.com/DavidGriffith/inform6lib"
license=('Artistic2.0')
groups=('inform')
source=("https://gitlab.com/DavidGriffith/inform6lib/-/archive/$pkgver/inform6lib-$pkgver.tar.gz")
sha256sums=('097dd51921d365a34172b3b5c9d56c41756b4de942dda556e719db333ef966b9')

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
