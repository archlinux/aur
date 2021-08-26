# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=hunspell-sl
pkgver=2020.12.31
pkgrel=1
pkgdesc="Slovene hunspell dictionary"
arch=(any)
url="https://extensions.libreoffice.org/en/extensions/show/slovenian-dictionary-pack"
license=('LGPL2.1')
optdepends=('hunspell: the spell checking libraries and apps')
source=('https://extensions.libreoffice.org/assets/downloads/752/pack-sl.oxt')
sha256sums=('0183eb7472a7da234be9dab8f89c0eb93b2fdf660b5ff2f80718ab4281189d00')

package() {
  install -Dm644 sl_SI.aff "$pkgdir"/usr/share/hunspell/sl_SI.aff
  install -Dm644 sl_SI.dic "$pkgdir"/usr/share/hunspell/sl_SI.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.dic "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.aff "$pkgdir"/usr/share/myspell/dicts
}
