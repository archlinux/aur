# Maintainer: Milos <archlinux.7lpxv@simplelogin.co>
# Contributor: Matej Groma <sbovdvvnir68a8hftegth9whs+arch-aur@matejgroma.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=hunspell-sk
pkgver=2.4.9
pkgrel=2
pkgdesc="Slovak dictionary for Hunspell"
arch=('any')
url="https://github.com/sk-spell/hunspell-sk"
license=('GPL2' 'LGPL2.1' 'MPL1.1')
optdepends=('hunspell: Hunspell spell checking library and program')
source=("https://github.com/sk-spell/hunspell-sk/releases/download/v$pkgver/$pkgver-sk@dictionaries.addons.mozilla.org.xpi")
sha512sums=('4f9788fe79cac3d79e09417b1d0583c94a818d2adb50599a9f77fd4a688178555df46caad6a6e5b9466053204788fc1594a713c67d30372ef096671f395efa36')

package() {
  cd "$srcdir"/dictionaries

  install -d -m755 "$pkgdir"/usr/share/hunspell
  install -m644 sk_SK.dic "$pkgdir"/usr/share/hunspell/sk_SK.dic
  install -m644 sk_SK.aff "$pkgdir"/usr/share/hunspell/sk_SK.aff

  install -d -m755 "$pkgdir"/usr/share/doc/hunspell-sk
  install -m644 doc/{AUTHORS,Copyright,Flagy*} "$pkgdir"/usr/share/doc/hunspell-sk/

  install -d -m755 "$pkgdir"/usr/share/licenses/hunspell-sk
  install -m644 doc/{GPL,LGPL,MPL} "$pkgdir"/usr/share/licenses/hunspell-sk/

  install -d -m755 "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/sk_SK.dic "$pkgdir"/usr/share/myspell/dicts/sk_SK.dic
  ln -s /usr/share/hunspell/sk_SK.aff "$pkgdir"/usr/share/myspell/dicts/sk_SK.aff
}
