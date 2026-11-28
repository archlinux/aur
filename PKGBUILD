# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=keirouter-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Self-hostable AI gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/mydisha/keirouter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/keirouter_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/keirouter_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('47c3af99b4ca17dd49964480ee5c39c64336db93a10abe7b3e9a3d7aa5d26dff')
sha256sums_aarch64=('0f62a1981652d09f69b644c315699954b43f7f2ffa8254ad06e48091c409811f')

package() {
  install -Dm755 "keirouter/keirouter" "${pkgdir}/usr/bin/keirouter"
  install -Dm644 "keirouter/frontend/dist/pdfjs/standard_fonts/LICENSE_FOXIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/standard_fonts/LICENSE_LIBERATION" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/iccs/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/cmaps/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_QCMS" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_PDFJS_JBIG2" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_PDFJS_QUICKJS" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_PDFJS_OPENJPEG" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_PDFJS_QCMS" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_QUICKJS" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_OPENJPEG" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keirouter/frontend/dist/pdfjs/wasm/LICENSE_JBIG2" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
