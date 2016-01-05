# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=tldr
pkgname=tldr-cpp-client
pkgver=1.0
pkgrel=1
pkgdesc='C++ client for tldr: a simplified and community-driven man pages'
arch=('i686' 'x86_64')
url='https://github.com/tldr-pages/tldr-cpp-client'
depends=('curl')
makedepends=('clang')
license=('MIT')
provides=("${_name}=${pkgver}")
conflicts=('nodejs-tldr')
replaces=('nodejs-tldr')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fccd9c3fd516d7a3cfce16130e3f784947c89b2e2484e6d8c0a943b709bb6286')

build() {
  make -C "${srcdir}/${pkgname}-${pkgver}/src"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm 775 "src/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
