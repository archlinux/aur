# Maintainer: 3ED_0 <krzysztofas /at/ protonmail . com>
pkgname=deadbeef-plugin-rating
_pkgname=deadbeef-rating
pkgver=1.2
pkgrel=1
pkgdesc="song rating plugin"
url="https://github.com/splushii/deadbeef-rating"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('deadbeef')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/splushii/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2017bdd563c4f46a9af2d349ac8676b461969824ad1254cd653c7e70dcabff19')

build() {
  cd "${_pkgname}-${pkgver}"
  gcc -Wall -I/usr/include/deadbeef/ -fPIC -std=c99 -shared -O2 -o rating.so rating.c
}

package() {
  install -D -v -c "${srcdir}/${_pkgname}-${pkgver}/rating.so" "${pkgdir}/usr/lib/deadbeef/rating.so"
}

