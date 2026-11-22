# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=every-other-token-bin
pkgver=5.0.2
pkgrel=1
pkgdesc="Streams an LLM response and colours each token by the model's confidence from logprobs"
arch=('x86_64')
url="https://github.com/Mattbusel/Every-Other-Token"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/every-other-token-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('097322cc7e1584018738cdbc4ab2c0986854352d8c7eb1d359bc99ce223b4ef2')

package() {
  cd "every-other-token-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "every-other-token" "${pkgdir}/usr/bin/every-other-token"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
