pkgname=erlang_ls
pkgver=0.52.0
pkgrel=1
pkgdesc='The Erlang Language Server'
arch=(any)
url=https://erlang-ls.github.io/
license=(Apache)
depends=(erlang-nox)
makedepends=(rebar3)
source=(git+https://github.com/erlang-ls/erlang_ls.git#tag=$pkgver)
b2sums=('SKIP')

prepare() {
  cd $pkgname

  git cherry-pick 8700e96fba0087248ea27be2a7b09b9f3dc4ea44
}

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  PREFIX="$pkgdir/usr" make install
}
