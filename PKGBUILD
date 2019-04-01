# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=ncmdump-git
_basename="${pkgname%-git}"
pkgver=r20.ee3bdb4
pkgrel=1
pkgdesc='netease cloud music copyright protection file dump'
arch=('i686' 'x86_64')
url='https://github.com/anonymous5l/ncmdump'
conflicts=("$_basename")
provides=("$_basename")
license=('unknown')
depends=('taglib')
source=("$_basename"::'git+https://github.com/anonymous5l/ncmdump')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_basename"
  make
}

package() {
  install -Dm755 "$srcdir/$_basename/$_basename" "$pkgdir/usr/bin/$_basename"
}

# vim:set ts=8 sts=2 sw=2 et:
