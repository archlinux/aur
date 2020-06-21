# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=julia-beta-bin
_pkgver=1.5.0-beta1
pkgver=$(echo $_pkgver | sed 's/-/./g')
pkgrel=1
arch=('x86_64')
pkgdesc='High-level, high-performance, dynamic programming language - official beta binaries'
provides=(julia-beta)
conflicts=(julia julia-bin julia-git julia-nightly-bin)
depends=('gmp' 'suitesparse' 'hicolor-icon-theme' 'libssh2')
url='https://julialang.org/'
license=('MIT')
source=("https://julialang-s3.julialang.org/bin/linux/x64/${pkgver:0:3}/julia-${_pkgver}-linux-x86_64.tar.gz")
sha256sums=('7a81c386de7b0e8f291bfbe77cbb8e1679a03d974db2093806c78a2067b97ed9')
options=(!strip)

package() {
  cd $srcdir/julia-${_pkgver}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp -r {bin,etc,include,lib,share} ${pkgdir}/usr/
  install -Dm644 LICENSE.md \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}

# vim: ts=2 sw=2 et:

