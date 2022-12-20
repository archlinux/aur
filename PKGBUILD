# Maintainer: Milos <archlinux.7lpxv@simplelogin.co>
# Contributor: Matej Groma <sbovdvvnir68a8hftegth9whs+arch-aur@matejgroma.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=hunspell-sk
pkgver=2.4.7
pkgrel=1
pkgdesc="Slovak dictionary for Hunspell"
arch=('any')
url="https://github.com/sk-spell/hunspell-sk"
license=('GPL2' 'LGPL2.1' 'MPL1.1')
optdepends=('hunspell: Hunspell spell checking library and program')
source=("https://github.com/sk-spell/hunspell-sk/releases/download/v$pkgver/$pkgver-sk@dictionaries.addons.mozilla.org.xpi")
sha512sums=('4f5366994b14c768c6d2b2316e457766ced8364ed57865ea2583da4d091d780ec8aeed39012a359738d6d595d111543c268940acd280664f003c8375a43ef0c1')

package() {
  cd "$srcdir"/dictionaries

  install -d -m755 "$pkgdir"/usr/share/hunspell
  install -m644 sk_SK.dic "$pkgdir"/usr/share/hunspell/sk_SK.dic
  install -m644 sk_SK.aff "$pkgdir"/usr/share/hunspell/sk_SK.aff

  install -d -m755 "$pkgdir"/usr/share/doc/hunspell-sk
  install -m644 doc/{AUTHORS,Copyright,Flagy*} "$pkgdir"/usr/share/doc/hunspell-sk/

  install -d -m755 "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/sk_SK.dic "$pkgdir"/usr/share/myspell/dicts/sk_SK.dic
  ln -s /usr/share/hunspell/sk_SK.aff "$pkgdir"/usr/share/myspell/dicts/sk_SK.aff
}
