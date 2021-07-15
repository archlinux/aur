# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Kristof Szalay <krszalay at gmail dot com>

pkgname=adol-c
_pkgname=ADOL-C
pkgver=2.7.2
pkgrel=1
pkgdesc='Automatic Differentiation of Algorithms written in C/C++'
arch=('x86_64')
url="https://github.com/coin-or/${_pkgname}"
license=('EPL')
depends=('boost' 'colpack')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/releases/${pkgver}.tar.gz")
sha256sums=('701e0856baae91b98397960d5e0a87a549988de9d4002d0e9a56fa08f5455f6e')

build() {
  cd "${_pkgname}-releases-${pkgver}"

  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd "${_pkgname}-releases-${pkgver}"

  make DESTDIR="$pkgdir/" install
}
