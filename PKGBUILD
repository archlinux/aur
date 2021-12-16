# Maintainer: aditya-K2 <adityakurdunkar2@gmail.com>
pkgname=gomp-git
pkgver=r196.0db49ca
pkgrel=1
pkgdesc='MPD client inspired by ncmpcpp written in GO.'
arch=('any')
url="https://github.com/aditya-K2/gomp"
license=('GPL')
makedepends=('go')
source=("git+https://github.com/aditya-K2/gomp/")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}"
    go build
}

package() {
    cd "${pkgname%-git}"
    install -Dm 655 gomp -t "${pkgdir}/usr/bin"
}
