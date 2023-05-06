# Maintainer: plokid <wan_shiwen@outlook.com>
# Maintainer: wuhgit <wuhgit@users.noreply.github.com>

pkgname=rime-custom-pinyin-dictionary
pkgver=20230428
_reponame=CustomPinyinDictionary
pkgrel=1
pkgdesc="rime 自建拼音输入法词库，百万常用词汇量。"
arch=('any')
url="https://github.com/wuhgit/CustomPinyinDictionary"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'imewlconverter')
source=("https://github.com/wuhgit/${_reponame}/releases/download/assets/CustomPinyinDictionary_Fcitx_${pkgver}.tar.gz")
sha256sums=('95e9a95860e9e9bf87d8c97337dac18c72aee4106811f847a851f892a7bdfe03')

build() {
  libime_pinyindict -d CustomPinyinDictionary_Fcitx.dict temp.txt
  imewlconverter -i:libpy temp.txt -o:rime CustomPinyinDictionary.dict.yaml
}

package() {
  install -Dm644 CustomPinyinDictionary.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
