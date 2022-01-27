# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gnome-shell-extension-disable-unredirect
pkgver=3
pkgrel=3
_commit='1cfe33516762f524f708cb284a973bd9278ca029'
pkgdesc="Disables unredirect fullscreen windows in gnome-shell"
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect"
license=('GPL3')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/kazysmaster/${pkgname}/archive/${_commit}.tar.gz")
sha512sums=('395daaf1a7baea2280a8e33544e61b43b5eccab050b454fdcc0b023e9a7a5690ab82497d9b3b9b9cd4dc1a39a57f12cfd2115eca1d6d2b801b47dccd4ecfc346')

package() {
  cd "${srcdir}/${pkgname}-${_commit}/unredirect@vaina.lt"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/unredirect@vaina.lt/${i}"
  done
}
