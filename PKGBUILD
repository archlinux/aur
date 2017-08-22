# Maintainer: chetgurevitch <chetgurevitch @ protonmail . com>

pkgname=libmpack
pkgver=1.0.5
pkgrel=3
arch=('i686' 'x86_64')
url="https://github.com/libmpack/${pkgname}"
license=('MIT')
source=("https://github.com/libmpack/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4ce91395d81ccea97d3ad4cb962f8540d166e59d3e2ddce8a22979b49f108956')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" \
    PREFIX=/usr \
    install
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
