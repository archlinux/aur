# Maintainer: redponike <proton (dot) me>
# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=julia-bin
pkgver=1.11.5
pkgrel=1
pkgdesc="High-level, high-performance, dynamic programming language - official binaries"
arch=('x86_64' 'aarch64')
url="https://julialang.org"
license=('MIT')
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
source_x86_64=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
source_aarch64=("https://julialang-s3.julialang.org/bin/linux/aarch64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('723e878c642220cc0251a0e13758c059a389cadc7f01376feaf1ea7388fe8f9c')
sha256sums_aarch64=('f63203574fba25c9bda5e98b2f87f985d4672109855633a46bae32bfba3cbc0d')

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
