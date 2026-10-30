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
pkgver=0.5.0
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

sha256sums_x86_64=('75782230cf73baaea01f7a728601950a355fec9af227657ecc446f12f14e4fec')
sha256sums_i686=('ffe71d6db660ee737f5744e767edf72d32448df1fc6a1dbd3da1be37833081d2')

package() {
  cd "${srcdir}"

  install -Dm755 "cpp-gen"   "${pkgdir}/usr/bin/cpp-gen"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
