# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llamactl-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Manage and route llama.cpp, MLX and vLLM models with a web dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/lordmathis/llamactl"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lordmathis/llamactl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/llamactl-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/llamactl-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('7131e6696079420b1587b0f28abcae71d5dafe4f024339fe6578a68517db6e88')
sha256sums_x86_64=('3a26bf7f27b6da4ba7bbbe9b82e32c0c69c524137f441cb420fce86c916d964d')
sha256sums_aarch64=('cf133eb31c484e96798bca14992527ec7e006b94095b1749d094e0cfb0eacb10')

package() {
  install -Dm755 "llamactl" "${pkgdir}/usr/bin/llamactl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
