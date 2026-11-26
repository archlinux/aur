# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spray-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Precise, user-friendly HTTP fuzzer"
arch=('x86_64' 'aarch64')
url="https://github.com/chainreactors/spray"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/chainreactors/spray/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/spray_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/spray_linux_arm64")
sha256sums=('230184f60bae2feaf244f10a8bac053c8ff33a183bcc365b4d8b876d2b7f4809')
sha256sums_x86_64=('5e6c778790a93c79110394a1c43f8d1902e20c69f5f03e544347fda7cf9863e8')
sha256sums_aarch64=('907185fc9cacae2b0040a96e183d0893201bb2f194d32fdd73eeb6851d7dd03d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/spray"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
