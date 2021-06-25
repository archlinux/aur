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
sha256sums=('SKIP'
            '8452916580ddc7e18f814f448db4973d5f3722ee21f1938284fceb52df0b661e')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 img2sdat.sh "$pkgdir/usr/bin/img2sdat"
  install -Dm755 $pkgname/*.py -t "$pkgdir/usr/share/${pkgname%-git}"
}

