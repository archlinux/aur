# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sponge"
pkgname="${_pkgname}-bin"
pkgver=1.15.3
pkgrel=2
pkgdesc="Effortlessly build stable, reliable, and high-performance backend services with a \"low-code\" approach"
arch=('x86_64')
url="https://go-sponge.com"
_url="https://github.com/go-dev-frame/${_pkgname}"
license=('MIT')
depends=(
  'go'
  'protobuf'
  'protoc-gen-doc'
  'protoc-gen-go'
  "protoc-gen-go-gin=${pkgver}"
  'protoc-gen-go-grpc'
  "protoc-gen-go-rpc-tmpl=${pkgver}"
  'protoc-gen-gotag'
  "protoc-gen-json-field=${pkgver}"
  'protoc-gen-openapiv2'
  'protoc-gen-validate'
  'swag'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_x86_64=('e14af9813c579e9b84086e0f47e3bb063aded5871e9aeb70c65cb1d0a746a8ff')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
