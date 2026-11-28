# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=datadog-static-analyzer-bin
pkgver=0.9.13
pkgrel=1
pkgdesc="Datadog static code analyzer"
arch=('x86_64' 'aarch64')
url="https://github.com/DataDog/datadog-static-analyzer"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DataDog/datadog-static-analyzer/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/datadog-static-analyzer-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/datadog-static-analyzer-aarch64-unknown-linux-gnu.zip")
sha256sums=('4cccf8f8cb415ba8dff8ffc250c921e38664bfec01e156105da8b513fa469357')
sha256sums_x86_64=('a159a40227623cf0ad8ab69b0e21eeb1239d4cd47984ab0555becb58eeb0cdc5')
sha256sums_aarch64=('318dbf2ebf4a0fbae6392658ef9f5d4cb2381751212a64e086915ba1d204bd65')

package() {
  install -Dm755 "datadog-static-analyzer" "${pkgdir}/usr/bin/datadog-static-analyzer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
