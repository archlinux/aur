# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-cloverpinyin
pkgver=1.1.1
pkgrel=1
#pkgdesc="Clover Simplified pinyin input for rime."
pkgdesc="✤四叶草简体拼音输入方案 for rime"
arch=('x86_64')
url="https://www.fkxxyz.com/d/cloverpinyin/"
license=('LGPL')
depends=('rime-prelude' 'rime-emoji' 'rime-symbols')
makedepends=('librime')
source=(https://github.com/fkxxyz/rime-cloverpinyin/releases/download/${pkgver}/clover.schema-${pkgver}.zip)
sha256sums=('54bf84bd84312980a27bac056579cbfea840a40a7c91f320b91608aefde14d5d')

build(){
  cd $srcdir
  rime_deployer --compile clover.schema.yaml . /usr/share/rime-data
}

package() {
  cd $srcdir
  rm build/*.txt
  rm -rf opencc
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
