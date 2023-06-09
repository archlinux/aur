# Maintainer: plokid <wan_shiwen@outlook.com>
# Maintainer: wuhgit <wuhgit@users.noreply.github.com>

pkgname=rime-custom-pinyin-dictionary
pkgver=20230609
_reponame=CustomPinyinDictionary
pkgrel=1
pkgdesc="rime 自建拼音输入法词库，百万常用词汇量。"
arch=('any')
url="https://github.com/wuhgit/CustomPinyinDictionary"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'imewlconverter')
source=("https://github.com/wuhgit/${_reponame}/releases/download/assets/CustomPinyinDictionary_Fcitx_${pkgver}.tar.gz")
sha256sums=('e8efcd9ad837fe91915f4c6ccca9701d776d09df0727de762e9477672269433f')

build() {
  libime_pinyindict -d CustomPinyinDictionary_Fcitx.dict temp.txt
  imewlconverter -i:libpy temp.txt -o:rime CustomPinyinDictionary.dict.yaml
}

package() {
  install -Dm644 CustomPinyinDictionary.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
