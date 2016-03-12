# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=tldr
pkgname=tldr-cpp-client
pkgver=1.1.0
pkgrel=1
pkgdesc='C++ client for tldr: a simplified and community-driven man pages'
arch=('i686' 'x86_64')
url='https://github.com/tldr-pages/tldr-cpp-client'
depends=('curl' 'libzip')
makedepends=('clang')
license=('MIT')
provides=("${_name}=${pkgver}")
conflicts=('nodejs-tldr')
replaces=('nodejs-tldr')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('eed26fd5471963d63708e5142388d47f4619649070839dbfe1c46c7842975138')

build() {
  make -C "${srcdir}/${pkgname}-${pkgver}/src"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm 775 "src/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
