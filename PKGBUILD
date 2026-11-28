# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goca-bin
pkgver=1.25.17
pkgrel=1
pkgdesc="Code generator for Clean Architecture Go projects"
arch=('x86_64')
url="https://github.com/sazardev/goca"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sazardev/goca/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/goca-linux-amd64")
sha256sums=('055822eecc0b77d0f5d7fcd582227a9b93d9126605951583de540343890e0b31')
sha256sums_x86_64=('c5cf515c1fa7ab8a1fa931224836feae8a48ab78d85c73076b0291616766e329')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/goca"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
