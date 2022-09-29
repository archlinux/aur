# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=ncmdump-git
_basename="${pkgname%-git}"
pkgver=r9.131e769
pkgrel=1
epoch=1
pkgdesc='netease cloud music copyright protection file dump'
arch=('any')
url='https://github.com/taurusxin/ncmdump'
conflicts=("$_basename")
provides=("$_basename")
license=('unknown')
depends=('taglib')
makedepends=('git')
source=("$_basename"::'git+https://github.com/taurusxin/ncmdump')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_basename"
  make linux
}

package() {
  install -Dm755 "$srcdir/$_basename/$_basename" "$pkgdir/usr/bin/$_basename"
}

# vim:set ts=8 sts=2 sw=2 et:
