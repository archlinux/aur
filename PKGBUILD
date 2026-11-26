# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=koto-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Simple, expressive, embeddable programming language"
arch=('x86_64')
url="https://github.com/koto-lang/koto"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/koto-lang/koto/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/koto-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2091eb1338953a55967ef2f830f1eaf4e6ca09b9f890bcf1d53764b0cd4c7224')
sha256sums_x86_64=('d33462909f0d197418601e0eb182e4c880c64dd45af666abb5853a85c830ed80')

package() {
  install -Dm755 "koto" "${pkgdir}/usr/bin/koto"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
