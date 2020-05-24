# Maintainer: PinkD <443657547@qq.com>

pkgname=rime-pinyin-zhwiki
pkgver=20200501
pkgrel=2
release=0.2
pkgdesc="Fcitx RIME Pinyin Dictionary from zh.wikipedia.org"
arch=('any')
url="https://github.com/PinkD/rime-pinyin-zhwiki"
license=('Apache')
makedepends=('opencc')
source=("https://github.com/PinkD/rime-pinyin-zhwiki/archive/$release/$pkgname-$release.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('5686fddf1f2ef2d2cd43994f12d0257f'
         '4d2ee3cf2637abe67bf1332465f57f45')
filename=zhwiki-$pkgver-all-titles-in-ns0


prepare() {
  cd $pkgname-$release
  cp ../zhwiki-$pkgver-all-titles-in-ns0.gz ./
}

build() {
  cd $pkgname-$release
  make -j FILENAME="$filename"
}

package() {
  cd $pkgname-$release
  make FILENAME="$filename" DESTDIR="$pkgdir" install
}
