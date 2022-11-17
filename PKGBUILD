pkgname=julia-bin
pkgver=1.8.3
pkgrel=2
arch=('x86_64' 'aarch64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
url='https://julialang.org/'
license=('MIT')

case "$CARCH" in
  aarch64) _pkgarch="aarch64"
    sha256sums=('dbffb134a413b712d4a8e1ee8e665ea55edb0865719a1bad9979123d6433acc9')
    source=("https://julialang-s3.julialang.org/bin/linux/${_pkgarch}/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
    ;;
  x86_64) _pkgarch="x64"
    sha256sums=('33c3b09356ffaa25d3331c3646b1f2d4b09944e8f93fcb994957801b8bbf58a9')
    source=("https://julialang-s3.julialang.org/bin/linux/${_pkgarch}/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
    ;;
esac

options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share,libexec} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/julia/LICENSE.md
}

# vim: ts=2 sw=2 et:

