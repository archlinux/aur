pkgname=julia-bin
pkgver=1.9.4
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
url='https://julialang.org/'
license=('MIT')
source_x86_64=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('07d20c4c2518833e2265ca0acee15b355463361aa4efdab858dad826cf94325c')
source_aarch64=("https://julialang-s3.julialang.org/bin/linux/aarch64/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_aarch64=('541d0c5a9378f8d2fc384bb8595fc6ffe20d61054629a6e314fb2f8dfe2f2ade')
options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
