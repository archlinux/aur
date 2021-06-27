# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=stepreduce-git
pkgver=r4.e89091c
pkgrel=1
epoch=0
pkgdesc="A deduplicating tool for step files"
arch=(x86_64)
url="https://gitlab.com/sethhillbrand/stepreduce"
license=('GPL3')
source=(git+https://gitlab.com/sethhillbrand/stepreduce.git)
sha256sums=('SKIP')

pkgver() {
  cd stepreduce
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd stepreduce
  #./configure --prefix=/usr
  make
}

package() {
  cd stepreduce
  install -Dt "${pkgdir}/usr/bin" -m0755  stepreduce
}
