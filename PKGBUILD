# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=getspecstory-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="Save and search AI coding agent conversations locally"
arch=('x86_64' 'aarch64')
url="https://github.com/specstoryai/getspecstory"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/specstoryai/getspecstory/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/SpecStoryCLI_Linux_x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/SpecStoryCLI_Linux_arm64.zip")
sha256sums=('43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1')
sha256sums_x86_64=('a21b5d52637468b96b1a99faff4e6ea0102803c76cdaf34af5c747ecda7e68ef')
sha256sums_aarch64=('ce1241fc2f3e5ae80a6fc0bf2ec5a91f85641aafc7cbb1d73cbed0a9f8898763')

package() {
  install -Dm755 "specstory" "${pkgdir}/usr/bin/specstory"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
