# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: AeroNotix <aaron.l.france@gmail.com>
# Contributor: AeroNotix <aaron.l.france@gmail.com>

pkgname=rebar
epoch=1
pkgver=2.6.4
pkgrel=3
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/rebar/rebar"
license=('APACHE')
depends=('erlang-nox')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rebar/rebar/archive/$pkgver.tar.gz")
sha256sums=('577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07')

build() {
  cd "$srcdir/rebar-$pkgver"
  make
}

package() {
  cd "$srcdir/rebar-$pkgver"
  install -Dm0755 "rebar" "$pkgdir/usr/bin/rebar"
  install -Dm0644 "priv/shell-completion/bash/rebar" "$pkgdir/usr/share/bash-completion/completions/rebar"
  install -Dm0644 "priv/shell-completion/zsh/_rebar" "$pkgdir/usr/share/zsh/functions/Completion/Zsh/_rebar"
  install -Dm0644 "priv/shell-completion/fish/rebar.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rebar.fish"
}
