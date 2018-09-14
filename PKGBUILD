# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3
pkgver=3.6.2
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/rebar/rebar3"
license=('APACHE')
depends=('erlang-nox')
optdepends=('rebar3-zsh: ZSH completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rebar/rebar3/archive/${pkgver}.tar.gz")
md5sums=('f83b990593da3d9d69a40a3d07f161c9')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  HOME="." ./bootstrap
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm0644 "priv/shell-completion/bash/rebar3" "$pkgdir/usr/share/bash-completion/completions/rebar3"
}
