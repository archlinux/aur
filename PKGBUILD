# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gnome-shell-extension-disable-unredirect
pkgver=3
pkgrel=2
_commit='2a4c0e6a7a7a5f1aad9907ee2cf43d0725e10c19'
pkgdesc="Disables unredirect fullscreen windows in gnome-shell"
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect"
license=('GPL3')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kazysmaster/${pkgname}/archive/${_commit}.tar.gz")
sha512sums=('628cd8bcbb0cf246ac2bdcc473d0211a53102a39d3a9b59b7e5670435de4b6d27515e46ca4974500142f877c31adb5ba76cc4340afa01eefccdd7316fe41cc86')

package() {
  cd "${srcdir}/${pkgname}-${_commit}/unredirect@vaina.lt"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/unredirect@vaina.lt/${i}"
  done
}
