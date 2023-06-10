# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3
pkgver=3.22.0
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/erlang/rebar3"
license=('APACHE')
depends=('erlang-nox')
optdepends=('rebar3-zsh: ZSH completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erlang/rebar3/archive/${pkgver}.tar.gz")
md5sums=('a8e8f6d7dc76e4543ffde270d22d226d')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  HOME="." ./bootstrap
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm0644 "apps/rebar/priv/shell-completion/bash/rebar3" "$pkgdir/usr/share/bash-completion/completions/rebar3"
}
