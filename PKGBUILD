# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=hunspell-sl
pkgver=2025.01.02
pkgrel=1
pkgdesc="Slovene hunspell dictionary"
arch=(any)
url="https://extensions.libreoffice.org/en/extensions/show/slovenian-dictionary-pack"
license=('LGPL2.1')
optdepends=('hunspell: the spell checking libraries and apps')
source=('https://extensions.libreoffice.org/assets/downloads/752/1735835020/pack-sl.oxt')
sha512sums=('e25542dbef96784e8658dbe9246bce4950c6d6463f390a9b986b821fbdca781c1cc2843a45e9a846f36ad0f46aea0f7a219580857fa7592223b5a84ae7aa4c33')

package() {
  install -Dm644 sl_SI.aff "$pkgdir"/usr/share/hunspell/sl_SI.aff
  install -Dm644 sl_SI.dic "$pkgdir"/usr/share/hunspell/sl_SI.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.dic "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.aff "$pkgdir"/usr/share/myspell/dicts
}
