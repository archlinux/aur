# Maintainer: Milos <archlinux.7lpxv@simplelogin.co>
# Contributor: Matej Groma <sbovdvvnir68a8hftegth9whs+arch-aur@matejgroma.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=hunspell-sk
pkgver=2.4.6
pkgrel=1
pkgdesc="Slovak dictionary for Hunspell"
arch=('any')
url="https://github.com/sk-spell/hunspell-sk"
license=('GPL2' 'LGPL2.1' 'MPL1.1')
optdepends=('hunspell: Hunspell spell checking library and program')
source=("https://github.com/sk-spell/hunspell-sk/releases/download/v$pkgver/$pkgver-sk@dictionaries.addons.mozilla.org.xpi")
sha512sums=('cf73e0b73e93253d887c576492f243238ac548c2b9688feda8606b413e45f865ba7f0647f5d3da385a7cff563d0325191f0c442385ba4efb5e766bfcfde80e90')

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
