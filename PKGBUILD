# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3
pkgver=3.2.0
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/rebar/rebar3"
license=('APACHE')
depends=('erlang-nox')
optdepends=('rebar3-zsh: ZSH completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rebar/rebar3/archive/${pkgver}.tar.gz")
md5sums=('a6a2dd5e722f1cd4717f32b7d7f695dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./bootstrap
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm0644 "priv/shell-completion/bash/rebar3" "$pkgdir/usr/share/bash-completion/completions/rebar3"
}
