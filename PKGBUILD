# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=rebar3
_pkgver=beta-2
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/rebar/rebar3"
license=('APACHE')
depends=('erlang-nox')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rebar/rebar3/archive/${_pkgver}.tar.gz")
md5sums=('a5ea54bc34f88c111b8d0b282a6ab82f')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  ./bootstrap
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  install -Dm0755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm0644 "priv/shell-completion/bash/rebar3" "$pkgdir/usr/share/bash-completion/completions/rebar3"
}
