# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-cloverpinyin
pkgver=1.1.2
pkgrel=2
#pkgdesc="Clover Simplified pinyin input for rime."
pkgdesc="✤四叶草简体拼音输入方案 for rime"
arch=('x86_64')
url="https://www.fkxxyz.com/d/cloverpinyin/"
license=('LGPL')
depends=('rime-prelude' 'rime-emoji' 'rime-symbols')
makedepends=('librime')
source=(https://github.com/fkxxyz/rime-cloverpinyin/releases/download/${pkgver}/clover.schema-${pkgver}.zip)
sha256sums=('d5be118497d60b7d07ef2daa2e03d1ab9fab5796e685578856b53d42b48dad2a')

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
