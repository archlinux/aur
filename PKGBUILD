# Maintainer: Gimo <self@gimo.me>
pkgname=mecab-ipadic-neologd-git
pkgver=r20180921
pkgrel=1
pkgdesc="Neologism dictionary for MeCab"
arch=('any')
url="https://github.com/neologd/mecab-ipadic-neologd"
license=('Apache')
depends=('mecab')
makedepends=('git' 'mecab-ipadic')
source=("${pkgname%-git}::git+https://github.com/neologd/mecab-ipadic-neologd.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s" "$(git log -1 --format=%cd --date=format:%Y%m%d)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    ./bin/install-mecab-ipadic-neologd -p "$pkgdir$(mecab-config --libexecdir)/dic/${pkgname%-git}" -n -u -y
}
