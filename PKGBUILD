pkgname=julia-bin
pkgver=1.10.4
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
url='https://julialang.org/'
license=('MIT')
source_x86_64=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('079f61757c3b5b40d2ade052b3cc4816f50f7ef6df668825772562b3746adff1')
source_aarch64=("https://julialang-s3.julialang.org/bin/linux/aarch64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_aarch64=('ae4ae6ade84a103cdf30ce91c8d4035a0ef51c3e2e66f90a0c13abeb4e100fc4')

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
