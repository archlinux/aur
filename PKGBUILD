# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.55.1
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://github.com/yoheimuta/${_pkgname}"
license=('MIT')
provides=("${_pkgname}" 'protoc-gen-protolint'{,-bin})
conflicts=("${_pkgname}" 'protoc-gen-protolint')
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv7.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('5f142778c3bab7843a077b0fb27b7e46f63c4488edeaf283f34f0407e2eebc1f')
sha256sums_armv6h=('efe78290b1e2d93f74083c7887f1391edc89de5e328fb870a86eb1d8f372d41a')
sha256sums_armv7h=('7643a4ac0544dffd4d26c80eac0f2a7cfc94eefef1301ee403c74cd5d6365131')
sha256sums_x86_64=('2deada2a211351f7a37bf3c51ae1702b58b502ee8236440bf55a96c31d7f6519')

package() {
  cd "${srcdir}"
  for binary in "${conflicts[@]}"; do
    install -vDm755 "${binary}" "${pkgdir}/usr/bin/${binary}"
  done

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
