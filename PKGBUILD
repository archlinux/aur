# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-pinyin-zhwiki
pkgver=20210301
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
            '73bdccef535f9cbbb7936f57a7b6276eb130b5b6dc9ddee374534d4f7560a03c2e6b1264ec7d2a5ea3c7c1798bce1fe337151284e4e398ea8e596698dba9a604')

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
