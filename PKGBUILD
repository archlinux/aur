# Maintainer: Milos <archlinux.7lpxv@simplelogin.co>
# Contributor: Matej Groma <sbovdvvnir68a8hftegth9whs+arch-aur@matejgroma.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=hunspell-sk
pkgver=2.4.8
pkgrel=2
pkgdesc="Slovak dictionary for Hunspell"
arch=('any')
url="https://github.com/sk-spell/hunspell-sk"
license=('GPL2' 'LGPL2.1' 'MPL1.1')
optdepends=('hunspell: Hunspell spell checking library and program')
source=("https://github.com/sk-spell/hunspell-sk/releases/download/v$pkgver/$pkgver-sk@dictionaries.addons.mozilla.org.xpi")
sha512sums=('ce9a187f8190d2d1790e1ab6baf1038b113f0e71e666fc2e97e5d13c5b40ce146b10efde10e78971aaa73fe962710f0d67e6688ebfde66268e6a8a39c878f915')

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
