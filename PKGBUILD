# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.55.6
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
sha256sums_aarch64=('201aedcfc672cfd8125154135e6cc5c0011eb6182d76b97724b0b787d654a620')
sha256sums_armv6h=('b7c46701f8118594307023103d93aa54e60619947d3cf61a2629818d7b781892')
sha256sums_armv7h=('42ef7602d738c6448abe03465ce5b932c4d5f2b43f06a358f021b6426de7384b')
sha256sums_x86_64=('69be01da7974d8f73c25718417be4ff3c0f7162551176e22af8b1bc787e1ea14')

package() {
  cd "${srcdir}"
  for binary in "${conflicts[@]}"; do
    install -vDm755 "${binary}" "${pkgdir}/usr/bin/${binary}"
  done

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
