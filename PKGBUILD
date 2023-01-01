# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gnome-shell-extension-disable-unredirect
pkgver=3.3
pkgrel=1
_commit='4bedd2c81e8adc1acc11a319272f2187d82b4002'
pkgdesc="Disables unredirect fullscreen windows in gnome-shell"
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect"
license=('GPL3')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/kazysmaster/${pkgname}/archive/${_commit}.tar.gz")
sha512sums=('49037861147d837ee81fff30c00ed8364962b0fc0566eb287b153ce22d1be94007d679ea692e3ce4d74a875405b50fa9394b7db57a63445e229e824f37fcb826')

package() {
  cd "${srcdir}/${pkgname}-${_commit}/unredirect@vaina.lt"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/unredirect@vaina.lt/${i}"
  done
}
