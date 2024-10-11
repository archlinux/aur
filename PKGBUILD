# Maintained by Ary Kleinerman - kleinerman at gmail dot com

pkgname=kubectl-view-secret-git
_pkgname=kubectl-view-secret
pkgver=r44.9599a2e
pkgrel=1
pkgdesc="kubectl view-secret plugin"
url="https://github.com/elsesiy/kubectl-view-secret"
depends=('kubectl')
makedepends=('go')
license=('MIT')
arch=('x86_64')
conflicts=('kubectl-view-secret-bin')
source=("git+https://github.com/elsesiy/kubectl-view-secret.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m 0755 $_pkgname "$pkgdir/usr/bin/kubectl-view_secret"
}
