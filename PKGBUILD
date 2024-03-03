pkgname=julia-bin
pkgver=1.10.2
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
url='https://julialang.org/'
license=('MIT')
source_x86_64=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('51bccc9bb245197f24e6b2394e6aa69c0dc1e41b4e300b796e17da34ef64db1e')
source_aarch64=("https://julialang-s3.julialang.org/bin/linux/aarch64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_aarch64=('f319ff2812bece0918cb9ea6e0df54cc9412fc5ef8c0589b6a4fea485c07535d')
options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
