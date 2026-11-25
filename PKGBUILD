# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=local-studio-bin
pkgver=3.0.3
pkgrel=1
pkgdesc="Control panel for vLLM, SGLang, llama.cpp and ExLlamaV3"
arch=('x86_64' 'aarch64')
url="https://github.com/sybil-solutions/local-studio"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sybil-solutions/local-studio/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/local-studio-controller-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64-local-studio-controller::${_dl}/local-studio-controller-linux-arm64"
            "${pkgname}-${pkgver}-aarch64-stable::${_dl}/stable-linux-arm64.yml")
sha256sums=('935d8f2af0c703f9c39517ee57cc4930b19d02d533be930b63f0e82f93614b43')
sha256sums_x86_64=('d4bafae16575971083c1dc851126a2f7f62d79a20eaa52b7c1a7532a822f65d2')
sha256sums_aarch64=('d7aa184d716037248946d86dc5c218025bd8b5f4a89b48e3349bcf4c4be3b1e1' '752ffbb9baced79d0d9f817efd35f1e11140c3ef1e4111e06bdb5b0aae972b71')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/local-studio-controller"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
