# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=baur-bin
pkgver=5.4.7
pkgrel=1
pkgdesc="Incremental task runner for monorepos"
arch=('x86_64' 'aarch64')
url="https://github.com/simplesurance/baur"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/simplesurance/baur/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/baur-linux_amd64-${pkgver}.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/baur-linux_arm64-${pkgver}.tar.xz")
sha256sums=('39db8f9acf036595a2566ea3fe560bc7bd65d8749f088e0f4a4ef2f8a6cb4b34')
sha256sums_x86_64=('a631f2ccbba799604e26dacf45ad914250e5a1556ae556d398c7009330a9d485')
sha256sums_aarch64=('3c19729c1e7218ac917e69cbe450641e2f0199d3ccd2dcab6ef42610d6fbbec2')

package() {
  install -Dm755 "baur" "${pkgdir}/usr/bin/baur"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
