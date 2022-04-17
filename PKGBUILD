# Maintainer: Gavin Luo <lunt.luo#gmail.com>

pkgname=rime-emoji-git
_pkgname=rime-emoji
pkgver=0.0.0.20220315
pkgrel=1
pkgdesc="Emoji support for rime"
arch=('any')
url="https://github.com/rime/rime-emoji"
license=('LGPL')
conflicts=('rime-emoji')
provides=('rime-emoji')
source=("rime-emoji::git+https://github.com/rime/rime-emoji.git#branch=master")
sha512sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname" || return
  echo 0.0.0.$(git log -1 --date=format:"%Y%m%d" --format="%ad")
}

package() {
  cd "$srcdir/$_pkgname" || return
  install -Dm644 emoji_suggestion.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
