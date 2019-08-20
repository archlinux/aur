pkgname=julia-bin
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
url='https://julialang.org/'
license=('MIT')
source=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:3}/julia-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('926ced5dec5d726ed0d2919e849ff084a320882fb67ab048385849f9483afc47')
options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md \
      ${pkgdir}/usr/share/licenses/julia/LICENSE.md
}

# vim: ts=2 sw=2 et:

