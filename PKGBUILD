pkgname=julia-bin
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
pkgdesc='High-level, high-performance, dynamic programming language - official binaries'
provides=(julia)
conflicts=(julia)
url='https://julialang.org/'
license=('MIT')
source=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:3}/julia-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('30d126dc3598f3cd0942de21cc38493658037ccc40eb0882b3b4c418770ca751')
options=(!strip)

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/julia
  cp -r julia-${pkgver}/{bin,etc,include,lib,share} ${pkgdir}/usr/
  install -Dm644 julia-${pkgver}/LICENSE.md \
      ${pkgdir}/usr/share/licenses/julia/LICENSE.md
}

# vim: ts=2 sw=2 et:

