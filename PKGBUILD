# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=open-plan-annotator-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="Local-first annotator for AI agent plans"
arch=('x86_64' 'aarch64')
url="https://github.com/ndom91/open-plan-annotator"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/open-plan-annotator-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/open-plan-annotator-linux-arm64.tar.gz")
sha256sums_x86_64=('a7813e5d980e6ff1ac91cfe7697cc4bd917632bab5ba86acc781080cd4664380')
sha256sums_aarch64=('a2c6c603174a5f2d98d4ccefcdaeecedfe413169edca128c1ddc4a67e2e71256')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="open-plan-annotator-linux-x64" ;;
    aarch64) _dir="open-plan-annotator-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/open-plan-annotator" "${pkgdir}/usr/bin/open-plan-annotator"
}
