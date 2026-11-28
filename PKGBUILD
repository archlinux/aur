# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=linkpage-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Self-hosted alternative to Linktree"
arch=('x86_64' 'aarch64')
url="https://github.com/rhnvrm/linkpage"
license=('BSD-2-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/linkpage_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/linkpage_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d395d89836c45373b34eca1a62d337dc06b17fe2f41068bf01e1d854bbb23dfb')
sha256sums_aarch64=('1a4bdcbb93d4aef4ae3690109a4659dda60c6bd6ad0353e9ed7771bbcabf68ec')

package() {
  install -Dm755 "linkpage" "${pkgdir}/usr/bin/linkpage"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
