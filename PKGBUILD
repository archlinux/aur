# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gnome-shell-extension-disable-unredirect
pkgver=3
pkgrel=1
pkgdesc="Disables unredirect fullscreen windows in gnome-shell"
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect"
license=('GPL3')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kazysmaster/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('62a34ecb0fd8803b517d02b7ac7deff47d088c7e669b999398d10c3f167c93ef1f0c0438a9843bb88e8edfcb5a6fd2fa71d883976d5586ca0cb6fad520829601')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/unredirect@vaina.lt"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/unredirect@vaina.lt/${i}"
  done
}
