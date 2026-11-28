# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ntlmrain-bin
pkgver=0.1.19
pkgrel=1
pkgdesc="Recover NT hashes from NetNTLMv1 responses using WebGPU and table lookups"
arch=('x86_64')
url="https://github.com/outflanknl/ntlmrain"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/ntlmrain-linux-x86_64.zip")
sha256sums_x86_64=('3ca94846a9931e6c95eb87cd7ad8614c584ef753c2ea5a0d4f7443486903b9a3')

package() {
  install -Dm755 "ntlmrain" "${pkgdir}/usr/bin/ntlmrain"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
