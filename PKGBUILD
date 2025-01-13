# Maintainer: Erik Hedlund <erikcghedlund at outlook dot com>
_pkgname=gradualizer
pkgname=${_pkgname}-git
pkgver=112646d
pkgrel=1
pkgdesc="A Gradual type system for Erlang"
arch=('any')
url="https://github.com/josefs/Gradualizer"
license=('MIT')
depends=('erlang-nox')
optdepends=()
conflicts=()
provides=('gradualizer')
makedepends=('git' 'make')
source=("$_pkgname::git+https://github.com/josefs/Gradualizer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  make escript
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 "./bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
