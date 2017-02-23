# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=hunspell-sl
pkgver=2015.12.25
pkgrel=2
pkgdesc="Slovene hunspell dictionary"
arch=(any)
url="https://github.com/LibreOffice/dictionaries"
license=('LGPL2.1')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://extensions.libreoffice.org/extensions/slovenian-dictionary-pack/$pkgver/@@download/file/pack-sl.oxt")
md5sums=('a95158fff7aa901938b9bc67c4937a88')

package() {
  install -Dm644 sl_SI.aff "$pkgdir"/usr/share/hunspell/sl_SI.aff
  install -Dm644 sl_SI.dic "$pkgdir"/usr/share/hunspell/sl_SI.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.dic "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.aff "$pkgdir"/usr/share/myspell/dicts
}
