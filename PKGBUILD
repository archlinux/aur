# Maintainer: ChenyHsu <bu56fo58@gmail.com>

pkgname=otf-aoyagikouzant
pkgver=2.01
pkgrel=1
pkgdesc="Brush font created by calligrapher Kouzan Aoyagi, includes JIS Non-Kanji and level-1 Kanji."
arch=('any')
url="https://opentype.jp/aoyagikouzanfontt.htm"
license=('CUSTOM')
source=("https://opentype.jp/bin/AoyagiKouzanTOTF.zip"
        "https://opentype.jp/aoyagikouzanfontt.htm"
)
md5sums=('8ac2b94336e76fa80996d0be70c557de')

build() {
    iconv -f SHIFT-JIS -t UTF8 aoyagikouzanfontt.htm | sed -n 's|[^<]*<p>\([^<]*\)</p>[^<]*|\1\n|gp' > LICENSE     
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "AoyagiKouzanTOTF.otf"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
md5sums=('c663e0899b8ce92f76e05b711f017378'
         'b6f76bb1f1881ea9dcebedc4d64a2cb3')
