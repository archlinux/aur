# Maintainer: Kienyew <aobi100bt@hotmail.com>

pkgname=fcitx5-pinyin-chinese-idiom
pkgver=20200930
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Chinese Idiom Dictionary"
arch=('any')
license=('MIT')
makedepends=('libime')
source=('https://raw.githubusercontent.com/pwxcoo/chinese-xinhua/master/data/idiom.json')
md5sums=('SKIP')

build() {
  python3 convert.py $srcdir/idiom.json > idioms.raw
  libime_pinyindict idioms.raw idioms.dict
}

package() {
  install -Dm644 $srcdir/idioms.dict $pkgdir/usr/share/fcitx5/pinyin/dictionaries/idioms.dict
}
