pkgname=julia-bin
pkgver=1.9.2
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
depends=('bash' 'gmp' 'libnghttp2' 'libssh2' 'libunwind' 'python' 'llvm')
url='https://julialang.org/'
license=('MIT')


case "$CARCH" in
  aarch64) _pkgarch="aarch64"
    sha256sums=('682397f8895149f0e283f0b27bffc6694033bdfb19f9366c80f6efdf3685f27c')
    source=("https://julialang-s3.julialang.org/bin/linux/${_pkgarch}/${pkgver:0:3}/julia-${pkgver}-linux-${arch}.tar.gz")
    ;;
  x86_64) _pkgarch="x64"
    sha256sums=('4c2d799f442d7fe718827b19da2bacb72ea041b9ce55f24eee7b1313f57c4383')
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
