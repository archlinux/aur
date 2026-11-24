# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=git-ai-bin
pkgver=1.7.6
pkgrel=1
pkgdesc="Git extension for tracking AI-generated code in your repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/git-ai-project/git-ai"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/git-ai-project/git-ai/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/git-ai-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/git-ai-linux-arm64")
sha256sums=('8b630f843b98bfd63133e8b196c85cee003af873c2f70219c662c09afcbbfa84')
sha256sums_x86_64=('f6cda0cb43c1c9a3d68e7efe2d79577680ea6f382c31bf36a2162906f93f6c1c')
sha256sums_aarch64=('1326abd5547636e6b6b297ad79afc955e57e82361efac320d4f860147b95a87a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-ai"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
