# Maintainer: Sergey M <tz4678@gmail.com>

pkgname=hakrawler
pkgver=2.0
pkgrel=1
pkgdesc="Fast golang web crawler for gathering URLs and JavaSript file locations. This is basically a simple implementation of the awesome Gocolly library."
arch=(any)
url=https://github.com/hakluke/hakrawler
license=()
depends=()
makedepends=(git go)
conflicts=()
source=("git+https://github.com/hakluke/hakrawler.git")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --abbrev=0
}

build() {
  cd "${srcdir}/${pkgname}"
  go build
}

package() {
  install -Dm755 "${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
}
