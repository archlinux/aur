# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=tldr
pkgname=tldr-cpp-client
pkgver=1.3.2
pkgrel=1
pkgdesc='C++ client for tldr: a simplified and community-driven man pages'
arch=('i686' 'x86_64')
# url="https://github.com/tldr-pages/${pkgname}"
url="https://github.com/Accurate0/${pkgname}"
depends=('curl' 'libzip')
makedepends=('gcc')
license=('MIT')
provides=("${_name}=${pkgver}")
conflicts=('nodejs-tldr')
replaces=('nodejs-tldr')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('db7a5674ecb80cd7f60c577a2b976c90ecdb340df300230d3b0878f0029e5d37')

build() {
  make -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "man/${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
}

# vim:set ts=2 sw=2 et:
