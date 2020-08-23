# Maintainer: thallium <tuogengchen@gmail.com>

pkgname=fcitx5-flypy-git
pkgver=r3.6d9e657
pkgrel=1
pkgdesc='XiaoHeYinXing table for fcitx, also known as flypy or xhup.'
arch=('any')
license=('GPL')
makedepends=('git')
depends=('fcitx5' 'fcitx5-chinese-addons')
url='http://www.flypy.com'
source=("git://github.com/thallium/fcitx5-flypy-git.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  install -Dm644 flypy.conf "$pkgdir/usr/share/fcitx5/inputmethod/flypy.conf"
  install -Dm644 flypy.dict "$pkgdir/usr/share/libime/flypy.dict"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
