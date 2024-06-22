# Maintainer: robertfoster

pkgname=aliwe-git
pkgver=55.851c379
pkgrel=1
pkgdesc="WPA passphrase generator for AGPF Alice Routers in C (WPA script called alish is included)"
arch=('i686' 'x86_64')
url="https://github.com/M0Rf30/aliwe"
license=('GPL-3.0-only')
depends=(openssl)
makedepends=('git')
source=("${pkgname}::git+https://github.com/M0Rf30/aliwe.git")

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd "${pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP')
