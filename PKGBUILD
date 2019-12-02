# Maintainer: Amish <contact at via dot aur>
pkgname=wdsaver
pkgver=1.2
pkgrel=1
pkgdesc='Prevent hard drive from too frequent head parking'
arch=('x86_64')
url="https://github.com/amishmm/wdsaver"
license=('GPL')
optdepends=('hdparm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f054c5c99d0a05e403828b16149052c39ee1ef9433bbd6eee090090362e0d959')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 700 -t "${pkgdir}"/usr/bin wdsaver
  install -D -m 644 -t "${pkgdir}"/usr/share/doc/wdsaver README
  install -D -m 644 -t "${pkgdir}"/usr/lib/systemd/system wdsaver.service
}
