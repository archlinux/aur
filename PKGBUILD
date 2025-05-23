# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=sheepchat
_pkgver=425
pkgname="${_pkgname}-bin"
pkgver=1.9.165
pkgrel=1
pkgdesc="Multi chat for Streamers"
arch=('x86_64')
url="https://github.com/${_pkgname}/desktop"
license=('custom:unknown')
depends=("libappindicator-gtk3")
source=("${url}/releases/download/${_pkgver}/${_pkgname}-${pkgver}-linux-x64-setup-prod.deb")
sha512sums=("8f677f523983740932966ca1620d266fe9f7132bc34bba73cdbb68b840682d917aae2de793e7567a9206920b2c306deb3782d264e511956262a732e22e99702e")

prepare() {
  tar -xvf data.tar.xz
}

package() {
  chmod +x "${srcdir}/usr/bin/${_pkgname}"
  cp -r "${srcdir}/usr" "${pkgdir}"
}
