# Maintainer: thallium <tuogengchen@gmail.com>

pkgname=fcitx5-flypy
pkgver=0.0.1
pkgrel=1
pkgdesc='XiaoHeYinXing table for fcitx, also known as flypy or xhup.'
arch=('any')
license=('GPL')
makedepends=('git')
depends=('fcitx5' 'fcitx5-chinese-addons')
url='http://www.flypy.com'
source=("git://github.com/thallium/fcitx5-flypy.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  install -Dm644 flypy.conf "$pkgdir/usr/share/fcitx5/inputmethod/flypy.conf"
  install -Dm644 flypy.dict "$pkgdir/usr/share/libime/flypy.dict"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
