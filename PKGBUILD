# Maintainer: alienzj <lovelornpig@gmail.com>
_basename="rang"
pkgname=${_basename}-git
pkgver=3.1.r155.4950559
pkgrel=1
pkgdesc="A Minimal, Header only Modern c++ library for colors in your terminal"
arch=('i686' 'x86_64')
url="https://github.com/agauniyal/rang"
license=('The Unlicense')
makedepends=('git' 'cmake>=3.10.0')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=(${_basename}::git+https://github.com/agauniyal/rang.git)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  echo "3.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install  -D -m644 "${srcdir}/${_basename}/include/rang.hpp" \
	   "${pkgdir}/usr/include/rang.hpp"

  install  -D -m644 "${srcdir}/${_basename}/README.md" \
           "${pkgdir}/usr/share/doc/${_basename}/README"

  install  -D -m644 "${srcdir}/${_basename}/LICENSE" \
           "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
