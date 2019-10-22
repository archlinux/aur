# Maintainor: android arch@johnea.net
# Contributor : KanjiAlive
# Created: 2016-05-16
# Updated: source github url and docs 2019-10-21
pkgname=otf-japanese-radicals-font
pkgver=1.0
pkgrel=1
pkgdesc="Japanese Radicals font"
arch=('any')
license=('apache')
url="https://github.com/kanjialive/kanji-data-media/tree/master/radicals-font"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install='otf-japanese-radicals-font.install'
source=(https://github.com/kanjialive/kanji-data-media/raw/master/radicals-font/60-custom-glyphs.png
        https://github.com/kanjialive/kanji-data-media/raw/master/radicals-font/JapaneseRadicals-Regular.otf
        https://github.com/kanjialive/kanji-data-media/raw/master/radicals-font/LICENSE.txt
        https://github.com/kanjialive/kanji-data-media/raw/master/radicals-font/README.md
        https://github.com/kanjialive/kanji-data-media/raw/master/radicals-font/japanese-radicals.pdf)
md5sums=('67157e82d40f57ddf022d01bf9a69a7e'
         '9cd42d8d727f67db43729dea68fabfaf'
         '53e49f20ee48569fd6d86391c70460f9'
         '81d60a39e8b582c9a37d34ae961360de'
         'a8cc38846db9cb8a0539c35854436dde')

package() {
  echo "Packaging..."
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF/
  install -D -m644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
  install -D -m644 60-custom-glyphs.png "${pkgdir}"/usr/share/doc/${pkgname}/60-custom-glyphs.png
  install -D -m644 japanese-radicals.pdf "${pkgdir}"/usr/share/doc/${pkgname}/japanese-radicals.pdf
}

