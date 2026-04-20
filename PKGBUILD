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
pkgver=0.2.0
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

sha256sums_x86_64=('accc005f65fe1d828e2d93bfd07cf17e8747c21e20990c848dba7aaecfa18cdc')
sha256sums_i686=('7a6d2758fb47d737daff23995e1c49505b2da51bb989a44d4c073a375f6b8623')

package() {
  cd "${srcdir}"

  install -Dm755 "cpp-gen"   "${pkgdir}/usr/bin/cpp-gen"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
