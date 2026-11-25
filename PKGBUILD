# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=larql-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Run, serve, query and edit AI models in the inspectable VINDEX format"
arch=('x86_64')
url="https://github.com/chrishayuk/larql"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'openblas')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/chrishayuk/larql/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/larql-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ac16f5b441ceda45ca7a8a5d2dc02f49794bd3f506dbb081cee3e917f0a9f4af')
sha256sums_x86_64=('99d14e7683a7a875f43ce4fc426462f509b6596be94cc8643781dbbab387348d')

package() {
  install -Dm755 "larql-x86_64-unknown-linux-gnu/larql-server" "${pkgdir}/usr/bin/larql-server"
  install -Dm755 "larql-x86_64-unknown-linux-gnu/larql" "${pkgdir}/usr/bin/larql"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
