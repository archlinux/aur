pkgname=julia-bin
pkgver=1.10.5
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
url='https://julialang.org/'
license=('MIT')
source_x86_64=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('33497b93cf9dd65e8431024fd1db19cbfbe30bd796775a59d53e2df9a8de6dc0')
sha256sums_aarch64=('33497b93cf9dd65e8431024fd1db19cbfbe30bd796775a59d53e2df9a8de6dc0')
source_aarch64=("https://julialang-s3.julialang.org/bin/linux/aarch64/${pkgver:0:4}/julia-${pkgver}-linux-${arch}.tar.gz")

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia-bin/LICENSE.md
}

# vim: ts=2 sw=2 et:
