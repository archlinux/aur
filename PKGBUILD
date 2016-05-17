# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=hunspell-sl
pkgver=2015.07.13
pkgrel=1
pkgdesc="Slovene hunspell dictionary"
arch=(any)
url="https://github.com/LibreOffice/dictionaries"
license=('LGPL2.1')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("http://extensions.libreoffice.org/extension-center/slovenian-dictionary-pack/releases/$pkgver/pack-sl.oxt")
md5sums=('356c838cc153f09224d6f3f43dc7873a')
PKGEXT='.pkg.tar'

package() {
  install -Dm644 sl_SI.aff "$pkgdir"/usr/share/hunspell/sl_SI.aff
  install -Dm644 sl_SI.dic "$pkgdir"/usr/share/hunspell/sl_SI.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.dic "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.aff "$pkgdir"/usr/share/myspell/dicts
}
