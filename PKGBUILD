# Maintainer: matpdev <matheus2ep at gmail dot com>
# shellcheck disable=SC2034,SC2154
# ──────────────────────────────────────────────────────────────────────────────
# cpp-gen-bin — Arch User Repository package
# Downloads pre-compiled binaries from GitHub Releases.
#
# To update checksums after a new release:
#   updpkgsums
#
# To generate .SRCINFO:
#   makepkg --printsrcinfo > .SRCINFO
# ──────────────────────────────────────────────────────────────────────────────

pkgname=cpp-gen-bin
pkgver=0.0.12
pkgrel=1
pkgdesc='Modern C++ project generator with CMake, package managers, IDE configurations and development tools'
arch=('x86_64' 'i686')
url='https://github.com/matpdev/cpp-gen'
license=('MIT')
provides=('cpp-gen')
conflicts=('cpp-gen')
options=('!strip')

source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/matpdev/cpp-gen/releases/download/v${pkgver}/cpp-gen_${pkgver}_linux_amd64.tar.gz"
)
source_i686=(
  "${pkgname}-${pkgver}-i686.tar.gz::https://github.com/matpdev/cpp-gen/releases/download/v${pkgver}/cpp-gen_${pkgver}_linux_386.tar.gz"
)

sha256sums_x86_64=('2370c684174c17757e03050db803de13e62794f65168c9c7dc436080ae62399d')
sha256sums_i686=('8ef326fb2771ed3b3003a8f4594816861c8e2bcf37985f0ffa5fcad98a9fdb8b')

package() {
  cd "${srcdir}"

  install -Dm755 "cpp-gen"   "${pkgdir}/usr/bin/cpp-gen"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
