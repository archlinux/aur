# Maintainer: redponike <proton (dot) me>
# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=julia-bin
pkgver=1.12.0
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
sha256sums_x86_64=('6f87b8fcf5ef6a7371e8c79d948aedfa0ba28ce44447c446d7d82e70f0158da8')
sha256sums_aarch64=('98078b59890aee82e3170cdc2c6e65107e8699c325b9bf37fe42ddb48e62919f')

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
