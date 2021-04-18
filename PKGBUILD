# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.68
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=d5d05fa2e2fa7e1e11c869268660093bb92140ca
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog' 'libseccomp')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('23064f3e3f9cccc557d5dd5da4d8db58326e87fce4c94d63b95eef5cfec91d9d')

build() {
  cd "$srcdir/tcg-$commit"
  mkdir -p build
  cd build
  cmake -DVERSION=${pkgver} ..
  make -j
}

package() {
  cd "$srcdir/tcg-$commit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm4755 build/tcg "${pkgdir}/usr/bin/tcg"
}
