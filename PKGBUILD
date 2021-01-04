# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-pinyin-zhwiki
pkgver=20210101
_converterver=0.2.2
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.wikipedia.org"
arch=('any')
url="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'opencc' 'pypinyin')
source=("https://github.com/felixonmars/fcitx5-pinyin-zhwiki/archive/$_converterver/$pkgname-$_converterver.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('6e1ef1cd0279b7b16470e4673b171638'
         'b70ee3d141d3426b8e3abb8c272f7958')

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
