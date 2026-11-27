# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tokless-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="Set up coding agents with tools and unified instructions quickly"
arch=('x86_64' 'aarch64')
url="https://github.com/HoangP8/tokless"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/HoangP8/tokless/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tokless-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/tokless-linux-arm64")
sha256sums=('fc3da431c0e6225cc9f28425fa7b6f22b0f1e0a4a14821d2e600469643928a83')
sha256sums_x86_64=('faceb0139e1f9bfad2a6e3d6d05739b619c947d8e41fa283ca6ea87dcbe86d7f')
sha256sums_aarch64=('33f4c172c15a5e98fce024d7370787a8b9a4714467cd7a2e9640c06c84ff594c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tokless"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
