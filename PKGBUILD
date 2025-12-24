# Maintainer: redponike <proton (dot) me>
# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=julia-bin
pkgver=1.12.3
pkgrel=0
pkgdesc="High-level, high-performance, dynamic programming language - official binaries"
arch=('x86_64' 'aarch64')
url="https://julialang.org"
license=('MIT')
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
source_x86_64=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:4}/julia-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://julialang-s3.julialang.org/bin/linux/aarch64/${pkgver:0:4}/julia-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('8f7bd50f7472ae4eba8c5df6de31345d9ce2da17e22b94ffdfe603acaaf6b912')
sha256sums_aarch64=('32696125b996978a8ce0246176b1a46b08fb5013ab1a10dea5de2dcb0edfcc0c')

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
