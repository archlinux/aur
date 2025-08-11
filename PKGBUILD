# Maintainer: Hauke Mettendorf hauke@mettendorf.it
pkgname=smee-git
pkgver=0.0.34
pkgrel=1
pkgdesc="A package which provides smee. A captians best friend!"
arch=('x86_64')
url="https://github.com/hauke-cloud/smee"
license=('GPLv2')
source=("https://github.com/hauke-cloud/smee/archive/refs/tags/${pkgver}.zip")
sha256sums=('SKIP')

prepare() {
  mv "${srcdir}/smee-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/usr/bin/smee" "${pkgdir}/usr/bin/smee"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/etc/smee/default.conf" "${pkgdir}/etc/smee/default.conf"
}
