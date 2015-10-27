# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: AeroNotix <aaron.l.france@gmail.com>
# Contributor: AeroNotix <aaron.l.france@gmail.com>

pkgname=rebar
epoch=1
pkgver=2.6.1
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/rebar/rebar"
license=('APACHE')
depends=('erlang-nox')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rebar/rebar/archive/$pkgver.tar.gz")
md5sums=('1ae17dd671c0434012c7a688d4cf60e4')

build() {
  cd "$srcdir/rebar-$pkgver"
  make
}

package() {
  cd "$srcdir/rebar-$pkgver"
  install -Dm0755 "rebar" "$pkgdir/usr/bin/rebar"
  install -Dm0644 "priv/shell-completion/bash/rebar" "$pkgdir/usr/share/bash-completion/completions/rebar"
}
