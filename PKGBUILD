# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tfplan2md-bin
pkgver=1.48.0
pkgrel=1
pkgdesc="Convert Terraform plans into readable Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/oocx/tfplan2md"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/oocx/tfplan2md/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tfplan2md_${pkgver}_linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tfplan2md_${pkgver}_linux-arm64.tar.gz")
sha256sums=('9f167dc18993c8881ae6bbd9b9b231c9cc2f04a78f6969436a024109387b32c9')
sha256sums_x86_64=('31e086e167dc5978fc1a40c752dfd7df1df5fdc8708fd9e2a4c56dd603660139')
sha256sums_aarch64=('d5f5a481eeb49bff3255a0c1ec3fb512f40d999924702589b2003d5acca06d4b')

package() {
  install -Dm755 "tfplan2md" "${pkgdir}/usr/bin/tfplan2md"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
