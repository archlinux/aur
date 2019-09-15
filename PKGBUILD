# Maintainer: Matej Groma <sbovdvvnir68a8hftegth9whs+arch-aur@matejgroma.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=hunspell-sk
pkgver=20110228
pkgrel=1
pkgdesc="Slovak dictionary for Hunspell"
arch=('any')
url="http://www.sk-spell.sk.cx/hunspell-sk"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: Hunspell spell checking library and program')
source=(http://www.sk-spell.sk.cx/files/hunspell-sk-$pkgver.zip)
sha512sums=('594ac0ea0b4897fde335d3a6e3cb394e02ef643fddc80e296f756ba73c1fb0c5d8678b190c75289de861fde7d3237cbfd1e9a709fcd12a39868289a9501f934a')

package() {
  cd "$srcdir"/hunspell-sk-$pkgver

  install -d -m755 "$pkgdir"/usr/share/hunspell
  install -m644 sk_SK.dic "$pkgdir"/usr/share/hunspell/sk_SK.dic
  install -m644 sk_SK.aff "$pkgdir"/usr/share/hunspell/sk_SK.aff

  install -d -m755 "$pkgdir"/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/sk_SK.dic "$pkgdir"/usr/share/myspell/dicts/sk_SK.dic
  ln -s /usr/share/hunspell/sk_SK.aff "$pkgdir"/usr/share/myspell/dicts/sk_SK.aff
}
