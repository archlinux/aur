# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=skyinstaller-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Installer for Trails in the Sky voice acting mods"
arch=('x86_64')
url="https://github.com/chyyran/skyinstaller"
license=('MPL-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/chyyran/skyinstaller/${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/skyinstaller-linux-x64")
sha256sums=('86299535d4d06830eb8e53a37d074d7b51345eedfbe7edd89a1656bf35077662')
sha256sums_x86_64=('b65d1e8c3d3248805eca05fe1783796288a50a24e88ae45eb741f8a9e3ab6c31')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/skyinstaller"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
