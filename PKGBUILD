# Maintainer: willemw <willemw12@gmail.com>

pkgname=sdat2img-git
pkgver=r42.1b08432
pkgrel=1
pkgdesc="Convert sparse Android data image to filesystem image"
arch=('any')
url="https://github.com/xpirt/sdat2img"
license=('Apache')
depends=('python')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/xpirt/sdat2img.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  install -Dm755 sdat2img.py "$pkgdir/usr/bin/sdat2img"
}

