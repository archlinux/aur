# Maintainer: quantulr <quantulr at gmail dot com>

pkgname=gossa
pkgdesc="a fast and simple multimedia fileserver"
pkgver=0.1.8.0
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
url='https://github.com/pldubouilh/gossa'
provides=('gossa')
conflicts=('gossa-bin')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+https://github.com/pldubouilh/gossa#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  git submodule update --init --recursive
}

build() {
  cd ${pkgname}-${pkgver}
  make build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
