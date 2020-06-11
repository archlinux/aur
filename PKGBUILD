# Maintainer: PinkD <443657547@qq.com>

pkgname=rime-pinyin-zhwiki
pkgver=20200601
pkgrel=1
release=0.3
pkgdesc="Fcitx RIME Pinyin Dictionary from zh.wikipedia.org"
arch=('any')
url="https://github.com/PinkD/rime-pinyin-zhwiki"
license=('Apache')
source=("https://github.com/PinkD/rime-pinyin-zhwiki/archive/$release/$pkgname-$release.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('08e82fbd561c3ea1c3f0b069e8cc1480'
         '223f9ddca5e26714ae2777399637aeac')

prepare() {
  cd $pkgname-$release
  cp ../zhwiki-$pkgver-all-titles-in-ns0.gz ./
}

build() {
  cd $pkgname-$release
  make VERSION="$pkgver"
}

package() {
  cd $pkgname-$release
  make VERSION="$pkgver" DESTDIR="$pkgdir" install
}
