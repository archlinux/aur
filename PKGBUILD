# Maintainer: willker <wz dot willker at gmail dot com>

pkgname=123pan-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.9
pkgrel=1
pkgdesc="第三方123云盘客户端，解决了123云盘官方客户端的若干问题，并使用模拟移动端的方式解除每日流量1G限制，使用Python和PyQt制作"
arch=('x86_64')
url="https://www.123panng.top"
license=('Apache-2.0')
provides=("${_pkgname}")
options=('!debug')

source=(
  "${_pkgname}-${pkgver}.zip::https://github.com/123panNextGen/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.zip"
  "${_pkgname}.png::https://raw.githubusercontent.com/123panNextGen/logo/refs/heads/main/img/logo-v2.png"
  "${_pkgname}.desktop"
)
sha256sums=('6451f1e3ce442dada6a09b7d5cc81b9bcd5a13c1790d11da90a471a4486d2d9a'
            'edc9c43937c0fa612be160a83265756dea36566c3f227165ccb7010b0a84ccff'
            '5702ca7710a3f8033a0978ece1ccd3e24be4f7b2944054b7e8dc3361e97df579')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
