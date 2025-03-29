# Maintainer: redponike <proton (dot) me>
# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=julia-bin
pkgver=1.11.4
pkgrel=2
pkgdesc="High-level, high-performance, dynamic programming language - official binaries"
arch=('x86_64' 'aarch64')
url="https://julialang.org"
license=('MIT')
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
source_x86_64=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
source_aarch64=("https://julialang-s3.julialang.org/bin/linux/aarch64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('fb3d3c5fccef82158a70677c0044ac5ae40410eceb0604cdc8e643eeff21df8d')
sha256sums_aarch64=('859f1a8cc4bce6911bc912f0e226a6ba2b1c144110b9d559d88f5077513d0e37')

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
