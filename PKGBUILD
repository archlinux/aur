# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=sheepchat
_pkgver=429
pkgname="${_pkgname}-bin"
pkgver=1.9.169
pkgrel=1
pkgdesc="Multi chat for Streamers"
arch=('x86_64')
url="https://github.com/${_pkgname}/desktop"
license=('custom:unknown')
depends=("libappindicator-gtk3")
source=("${url}/releases/download/${_pkgver}/${_pkgname}-${pkgver}-linux-x64-setup-prod.deb")
sha512sums=("b3155035b6f26a520a5cf2aaa626fa277e7067f70bad1fd5161e296283fff64a3a1ac5f3ff5f54a99b681ddd569e5825d034644b0a2d29dd81ff833f9a9e3c4a")

prepare() {
  tar -xvf data.tar.xz
}

package() {
  chmod +x "${srcdir}/usr/bin/${_pkgname}"
  cp -r "${srcdir}/usr" "${pkgdir}"
}
