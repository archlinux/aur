# Maintainer : nikp123 <pavlica.nikola@gmail.com>
# Contributor : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=kalker-git
_pkgname=kalker
pkgver=v1.1.0.r19.gf3d8802
pkgrel=1
pkgdesc="A calculator program that supports user-defined variables, functions, derivation, and integration."
url="https://github.com/PaddiM8/kalker"
depends=('gcc-libs')
makedepends=('cargo' 'git')
arch=('i686' 'x86_64')
license=('MIT')
source=('git+https://github.com/PaddiM8/kalker')
conflicts=('kalker')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('SKIP')
