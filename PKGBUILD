# Maintainer: Vilsol <me at vil dot so>

pkgname=oshabi-bin
pkgver=0.0.26
pkgrel=1
pkgdesc='A scanner for Path of Exile harvest horticrafting stations and sacred grove.'
arch=(x86_64)
url=https://github.com/Vilsol/oshabi
license=(GPL3)
depends=(tesseract
         tesseract-data-eng
         opencv
         xsel
         webkit2gtk
         qt5-base)

provides=("${pkgname/-bin/}=${pkgver}")
conflicts=("${pkgname/-bin/}")

source=("${pkgname}_${pkgver}.tar.gz::https://github.com/Vilsol/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-amd64.tar.gz"
        "oshabi.desktop")

sha256sums=('fa296c15f01d1ec1f848caf05fe73ae1b5b878c72038ded67f56b4e67e1e9d90'
            '27038c830b270cc01df8fc989766e2eb444944a19230f4f25dae63c451456a9c')

package() {
  _output="${srcdir}/${pkgname/-bin/}-linux-amd64-v${pkgver}"
  install -Dm0755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "oshabi.desktop"
}