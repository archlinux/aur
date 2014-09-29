# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: AeroNotix <aaron.l.france@gmail.com>
# Contributor: AeroNotix <aaron.l.france@gmail.com>

pkgname=rebar
epoch=1
pkgver=2.5.1
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/rebar/rebar"
license=('APACHE')
depends=('erlang-nox')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rebar/rebar/archive/$pkgver.tar.gz")
md5sums=('3a95be5b064845b51cb8a3dba2f780e5')

build() {
  cd "$srcdir/rebar-$pkgver"
  make
}

package() {
  cd "$srcdir/rebar-$pkgver"
  install -Dm0755 "rebar" "$pkgdir/usr/bin/rebar"
  install -Dm0644 "priv/shell-completion/bash/rebar" "$pkgdir/usr/share/bash-completion/completions/rebar"
}
