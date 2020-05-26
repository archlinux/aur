# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-pinyin-zhwiki
pkgver=20200501
pkgrel=2
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.wikipedia.org"
arch=('any')
url="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'opencc' 'pypinyin')
source=("https://github.com/felixonmars/fcitx5-pinyin-zhwiki/archive/0.2/$pkgname-0.2.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('48335943da934c1f4be18537b48ea051'
         '4d2ee3cf2637abe67bf1332465f57f45')

prepare() {
  cd $pkgname-0.2
  cp ../zhwiki-$pkgver-all-titles-in-ns0.gz ./
}

build() {
  cd $pkgname-0.2
  make FILENAME=zhwiki-$pkgver-all-titles-in-ns0
}

package() {
  cd $pkgname-0.2
  make DESTDIR="$pkgdir" install
}
