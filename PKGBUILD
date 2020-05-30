# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-pinyin-zhwiki
pkgver=20200520
_converterver=0.2.1
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.wikipedia.org"
arch=('any')
url="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'opencc' 'pypinyin')
source=("https://github.com/felixonmars/fcitx5-pinyin-zhwiki/archive/$_converterver/$pkgname-$_converterver.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('2d01f45a73b7c686fef5c44472a9572b'
         '7e783c4611c642c64c50a7507fdb8d09')

prepare() {
  cd $pkgname-$_converterver
  cp ../zhwiki-$pkgver-all-titles-in-ns0.gz ./
}

build() {
  cd $pkgname-$_converterver
  make VERSION=$pkgver
}

package() {
  cd $pkgname-$_converterver
  make VERSION=$pkgver DESTDIR="$pkgdir" install
}
