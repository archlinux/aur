# Maintainer: Peter Hoeg <first name at last name dot com>

pkgname=defragfs
pkgver=1.1.1
pkgrel=1
pkgdesc="A user space file defragger"
arch=("any")
url="http://sourceforge.net/projects/${pkgname}"
license=('GPL')
depends=('perl')
source=("${pkgname}-${pkgver}.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}-1.1/${pkgname}-${pkgver}.gz/download")
sha1sums=('0e248e5dfc74ba3ec3e73f473df248c2c219686d')

package() {
  cd "$srcdir/"

  install -m755 -d "$pkgdir/usr/bin"
  install -m755    ${pkgname}-${pkgver} "$pkgdir/usr/bin/${pkgname}"

  install -m755 -d "$pkgdir/usr/share/doc/${pkgname}"
  perl ${pkgname}-${pkgver} . -h 2>&1 | fmt --width=72 > "$pkgdir/usr/share/doc/${pkgname}/README"
}
