# Maintainer: PinkD <443657547@qq.com>

pkgname=rime-pinyin-zhwiki
pkgver=20200501
pkgrel=1
pkgdesc="Fcitx RIME Pinyin Dictionary from zh.wikipedia.org"
arch=('any')
url="https://github.com/PinkD/rime-pinyin-zhwiki"
license=('Apache')
makedepends=('opencc')
source=("https://github.com/PinkD/rime-pinyin-zhwiki/archive/0.1/$pkgname-0.1.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('e646e1000a621917f073114c7edc9448'
         '4d2ee3cf2637abe67bf1332465f57f45')
filename=zhwiki-$pkgver-all-titles-in-ns0

prepare() {
  cd $pkgname-0.1
  cp ../zhwiki-$pkgver-all-titles-in-ns0.gz ./
}

build() {
  cd $pkgname-0.1
  make -j FILENAME="$filename"
}

package() {
  cd $pkgname-0.1
  make FILENAME="$filename" DESTDIR="$pkgdir" install
}
