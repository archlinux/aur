# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=hunspell-sl
pkgver=2019.12.25
pkgrel=1
pkgdesc="Slovene hunspell dictionary"
arch=(any)
url="https://extensions.libreoffice.org/extensions/slovenian-dictionary-pack/"
license=('LGPL2.1')
optdepends=('hunspell: the spell checking libraries and apps')
source=('https://extensions.libreoffice.org/assets/downloads/z/8b7ba8bb_pack-sl.oxt')
sha256sums=('4e18cff112b184cb01cbe002f457df2d9fa3e040045d2cccd77eb4d38f35dc36')

package() {
  install -Dm644 sl_SI.aff "$pkgdir"/usr/share/hunspell/sl_SI.aff
  install -Dm644 sl_SI.dic "$pkgdir"/usr/share/hunspell/sl_SI.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.dic "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.aff "$pkgdir"/usr/share/myspell/dicts
}
