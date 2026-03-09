# Maintainer: rjumen-aur rjumen-d@proton.me
pkgname=rjumen-git
pkgver=r5.c2b157f
pkgrel=1
pkgdesc="Simple python script from github"
arch=('any')
url="https://github.com/rjumen-git/rjumen"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+https://github.com/rjumen-git/rjumen.git")
md5sums=('SKIP')

pkgver() {
  cd rjumen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd rjumen
  install -Dm755 main.py "$pkgdir/usr/bin/rjumen"
  install -Dm644 val.py "$pkgdir/usr/bin/val.py"
}
