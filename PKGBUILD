# Maintainer: AeroNotix <aaron.l.france@gmail.com>
# Contributor: AeroNotix <aaron.l.france@gmail.com>

pkgname=rebar
pkgver=20131114
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('i686' 'x86_64')
url="https://github.com/rebar/rebar"
license=('APACHE')
depends=('erlang')
makedepends=('git')
source=("git://github.com/rebar/rebar.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/rebar"
  make
}

package() {
  cd "$srcdir/rebar"
  install -Dm0755 "rebar" "$pkgdir/usr/bin/rebar"
  install -Dm0644 "priv/shell-completion/bash/rebar" "$pkgdir/usr/share/bash-completion/completions/rebar"
}
