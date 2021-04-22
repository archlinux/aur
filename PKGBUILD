# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-pinyin-zhwiki
pkgver=20210420
_converterver=0.2.2
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.wikipedia.org"
arch=('any')
url="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'opencc' 'pypinyin')
source=("https://github.com/felixonmars/fcitx5-pinyin-zhwiki/archive/$_converterver/$pkgname-$_converterver.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
sha512sums=('c2be59f021cc0789f1cf5616722b09f3a09c70669fd966f03054d90642f40c3ddc88338e0c1f51665129285b6c57c6150dbaed98c84b28c0197adc041292b711'
            'e821f1c858b6c12d2085ac4b79f5f564d83107cddbb7b88d66e01297ab0d6b93a70207be850a14446505767d21408ec0a90006fcf66d0c6b1af7aa616c25449d')

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
