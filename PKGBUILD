pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from https://pinyin.sogou.com/dict/"
# Contributor: Asuka Minato
arch=('any')
url="https://github.com/CHN-beta/sougou-dict.git"
license=('custom')
makedepends=('libime')
_commit="c33638423355e557febfd7922b392a394c0ddefc"
source=(git+https://github.com/CHN-beta/sougou-dict.git#commit=$_commit)
sha512sums=('SKIP')

build() {
  cat sougou-dict/dict/*.txt > sougou.txt
  libime_pinyindict sougou.txt sougou.dict
}

package() {
  install -Dm644 sougou.dict -t $pkgdir/usr/share/fcitx5/pinyin/dictionaries/
}
