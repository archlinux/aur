# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=codeany-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="AI-powered terminal coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/codeany-ai/codeany"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/codeany-ai/codeany/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/codeany_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/codeany_linux_arm64.tar.gz")
sha256sums=('c60d393a1a1fd5bf5aafff95894408f9b3f1ee0a674f7a93b06f629b98149ab6')
sha256sums_x86_64=('7893382f1fcff304fff2b05e78c52af6171c0c6be3bdb31dbb378c8d1ad872f2')
sha256sums_aarch64=('f88204e93584fd7ea3bd0367e22acd1d13e3c8040d29a3342bc4e337a5a4aebe')

package() {
  install -Dm755 "codeany" "${pkgdir}/usr/bin/codeany"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
