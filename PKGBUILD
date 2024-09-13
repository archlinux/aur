# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=sheepchat
_pkgver=419
pkgname="${_pkgname}-bin"
pkgver=1.9.159
pkgrel=3
pkgdesc="Multi chat for Streamers"
arch=('x86_64')
url="https://github.com/${_pkgname}/desktop"
license=('custom:unknown')
depends=("libappindicator-gtk3")
source=("${url}/releases/download/${_pkgver}/${_pkgname}-${pkgver}-linux-x64-setup-prod.deb")
sha512sums=("78b0f81350135e3d6eb22665dfd01264db773d925523bb40ed4fbda7f235dce1316b3a7e51702d48d65947ddb5fa1fa0dec5817791d9f1c3ea5576fcb87f9ac5")

prepare() {
  tar -xvf data.tar.xz
}

package() {
  chmod +x "${srcdir}/usr/bin/${_pkgname}"
  cp -r "${srcdir}/usr" "${pkgdir}"
}
