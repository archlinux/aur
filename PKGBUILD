# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=utpm-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Package manager for local and remote Typst packages"
arch=('x86_64' 'aarch64')
url="https://github.com/typst-community/utpm"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/utpm-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/utpm-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f51cbb7eebbc38b684a2ce1f505b44d0c4a0f95ecac81fc3c9c07602883d7f9a')
sha256sums_aarch64=('0239b7e497cadc08bde282d5f00412e60a8773b8d8dfe04414c2d77cc7053680')

package() {
  install -Dm755 "utpm" "${pkgdir}/usr/bin/utpm"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "utpm.bash" "${pkgdir}/usr/share/bash-completion/completions/utpm"
  install -Dm644 "utpm.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/utpm.fish"
  install -Dm644 "_utpm" "${pkgdir}/usr/share/zsh/site-functions/_utpm"
}
