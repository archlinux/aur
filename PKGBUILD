# Maintainer: ChenyHsu <bu56fo58@gmail.com>
# Contributor: ChenyHsu <bu56fo58@gmail.com>

pkgname=otf-aoyagikouzant
pkgver=2.02
pkgrel=1
pkgdesc="Brush font created by calligrapher Kouzan Aoyagi, includes JIS Non-Kanji and level-1 Kanji."
arch=('any')
url="https://opentype.jp/aoyagikouzanfontt.htm"
license=('CUSTOM')
source=("https://opentype.jp/bin/AoyagiKouzanTOTF.zip"
        "https://opentype.jp/aoyagikouzanfontt.htm"
)
md5sums=('93edd00fbf73424c28a87eda4b7aca94'
         '0b292752d0b2d1c65f0798119c0d4421')

build() {
    iconv -f SHIFT-JIS -t UTF8 aoyagikouzanfontt.htm | sed -n 's|[^<]*<p>\([^<]*\)</p>[^<]*|\1\n|gp' > LICENSE     
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "AoyagiKouzanTOTF.otf"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
