# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: winlu <derwinlu@gmail.com>

pkgname=rebar3
pkgver=3.23.0
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/erlang/rebar3"
license=('Apache-2.0')
depends=('erlang-nox')
optdepends=('rebar3-zsh: ZSH completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erlang/rebar3/archive/${pkgver}.tar.gz")
sha256sums=('00646b692762ffd340560e8f16486dbda840e1546749ee5a7f58feeb77e7b516')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  HOME="." ./bootstrap
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm0644 "apps/rebar/priv/shell-completion/bash/rebar3" "$pkgdir/usr/share/bash-completion/completions/rebar3"
}
