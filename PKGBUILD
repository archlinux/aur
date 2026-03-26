# Maintainer: Amolith <amolith@secluded.site>
pkgname='goradion-bin'
_pkgname="${pkgname%-bin}"
pkgdesc='Terminal based online radio player'
pkgver=0.8.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/agejevasv/goradion"
license=('Unlicense')
depends=('mpv')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname")

source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
b2sums_x86_64=('1bb87fab8d29ab161bd5b6ad83d46a1fe953b334519a0a481f692ed9db34b8d6455f4a26df8831ba427625c61f52c09474b9597db50344990cef1302087ac1f0')
b2sums_aarch64=('412b9542f892d44efb39ee4b903d97475cea24d0b9f41dfcbfa43d8812658496a5b6aa78316b31a63d84ce81319940e786574c2f668125d76a708a2ffe10078c')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
}
