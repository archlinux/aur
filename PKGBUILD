pkgname=els_dap
pkgver=0.2.0
pkgrel=1
pkgdesc='The Erlang LS DAP Debugger'
arch=(any)
url=https://github.com/erlang-ls/els_dap
license=(Apache)
depends=(erlang-nox)
makedepends=(git rebar3)
source=(git+https://github.com/erlang-ls/els_dap.git#tag=$pkgver)
b2sums=('SKIP')

prepare() {
  cd $pkgname

  sed -i 's/rebar3_lint, "1\.0\.2"/rebar3_lint, "3.2.6"/' rebar.config
}

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  PREFIX="$pkgdir/usr" make install
}
