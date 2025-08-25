# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.56.4
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://github.com/yoheimuta/${_pkgname}"
license=('MIT')
provides=("${_pkgname}" 'protoc-gen-protolint')
conflicts=("${_pkgname}" 'protoc-gen-protolint')
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv7.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('b37c939a2dbd2164a2b473f06e4d07f9a9d291466d988abe5cad013796d9bebe')
sha256sums_armv6h=('16c2a1eb7e7c1e6abc6ec22aa8fcd61349deee801a76c8a634e48807b928609f')
sha256sums_armv7h=('e152b02c229d8f3b4e3f12669897bb6fc17ce2ee1454bffea07dab567b1f4e78')
sha256sums_x86_64=('94d0a910f4da6aef63b331bb9cb2dcbc6ec3e4374a1213f02919f888fe796249')

package() {
  cd "${srcdir}"
  for binary in "${conflicts[@]}"; do
    install -vDm755 "${binary}" "${pkgdir}/usr/bin/${binary}"
  done

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
