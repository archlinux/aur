# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wacrawl-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Archive and search your WhatsApp history locally"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/wacrawl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wacrawl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wacrawl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0ae3e4e3a892f884e4f08ec8cf37ccf934b1fc261a26a3084d98e0420bbc80e6')
sha256sums_aarch64=('353197b4eb0e53732c783713e85977d2006d94106095ef0d5bf2964a70d3d18e')

package() {
  install -Dm755 "./wacrawl" "${pkgdir}/usr/bin/wacrawl"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
