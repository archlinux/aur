# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=traceview-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Tracing and viewing your files and resource landscape"
arch=('x86_64' 'aarch64')
url="https://github.com/javaLux/traceview"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/javaLux/traceview/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/traceview_${pkgver}-gnu-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/traceview_${pkgver}-gnu-linux-aarch64.tar.gz")
sha256sums=('7e3e27db1729df67915bde6fdf37420ca9977a96b3ed7d95f4d70f574a0d500d')
sha256sums_x86_64=('171f589e1ac41b2e0bda28beccc4c3f32513f29ababb77171c173a84a1a6af3d')
sha256sums_aarch64=('9fad13922b99e83d5d28d5ea0d168492382f561507803196496ca3e3c4b21130')

package() {
  install -Dm755 "traceview" "${pkgdir}/usr/bin/traceview"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
