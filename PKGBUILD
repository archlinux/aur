# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=janice-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Desktop app for viewing large JSON files"
arch=('x86_64')
url="https://github.com/ErikKalkoken/janice"
license=('MIT')
depends=('glibc' 'libglvnd' 'libx11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ErikKalkoken/janice/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/janice-${pkgver}-linux-amd64.tar.xz")
sha256sums=('81e164e17767009a6da7b0b0c3d465d2d2996bd2d92c0eb29e6b1648f05329f2')
sha256sums_x86_64=('2f7bcb21e64fe375a40eb1f055aa2b139204347fef0bbeb6c2acc77c8a3941ef')

package() {
  install -Dm755 "usr/local/bin/janice" "${pkgdir}/usr/bin/janice"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
