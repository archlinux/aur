# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.55.5
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
sha256sums_aarch64=('8b2b7de34beb1e8d1f811744aa2e2bd458fa6de1bf49e809c4ce35df91472ff0')
sha256sums_armv6h=('e7a996f916abf12383c16106531814ccf5b0c122a810be175615a784e51836d2')
sha256sums_armv7h=('d6ea9d4970070670af3d8e18119eec915a1de62f7f0cef39f1c6689fcc57e42d')
sha256sums_x86_64=('8ae0519f1b203605c08fe84c8c0f6bd9b844cef3d0f807fca7def060d1ea3677')

package() {
  cd "${srcdir}"
  for binary in "${conflicts[@]}"; do
    install -vDm755 "${binary}" "${pkgdir}/usr/bin/${binary}"
  done

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
