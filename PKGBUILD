# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=arcpp
pkgname=${_pkgname}-git
pkgver=0.13.2.r0.g946c5c5
pkgrel=1
pkgdesc="An implementation of the Arc programming language. (GIT version)"
arch=('x86_64' 'i686')
url="https://github.com/kimtg/Arcpp"
license=('Apache')
depends=('readline')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/kimtg/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed -e 's/v//;s/-/.r/;s/-/./'
}

build() {
  cd ${_pkgname}
  make readline
}

package() {
  cd ${_pkgname}
  install -Dm755 "arc++" "${pkgdir}/usr/bin/arc++"
}

# vim:set ts=2 sw=2 et:
