# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gnome-shell-extension-disable-unredirect
pkgver=2
pkgrel=1
pkgdesc="Disables unredirect fullscreen windows in gnome-shell"
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect"
license=('GPL3')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kazysmaster/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('15a97161e47db6f696e1bb36baf072067c81b01b335d3936755e58cd489d1f2e1c3c264581488be7484c213ef849c0456de0e5191f544671f1517a255c53e566')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/unredirect@vaina.lt"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/unredirect@vaina.lt/${i}"
  done
}
