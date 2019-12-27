# Maintainer: willemw <willemw12@gmail.com>

pkgname=img2sdat-git
pkgver=r28.a4fdf7c
pkgrel=1
pkgdesc="Convert sparse filesystem image to sparse Android data image"
arch=('any')
url="https://github.com/xpirt/img2sdat"
license=('Apache')
depends=('python')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/xpirt/img2sdat.git
        img2sdat.sh)
md5sums=('SKIP'
         'c4854eebbd20f489f6024678c9bb5db2')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 img2sdat.sh "$pkgdir/usr/bin/img2sdat"

  cd $pkgname
  install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
  install -Dm755 *.py "$pkgdir/usr/share/${pkgname%-git}"
}

