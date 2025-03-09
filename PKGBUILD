# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.9.0'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
conflicts=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('21f7c297c5a0feb541db3c55c6ba445e3c0c18b35af6fa6e956b43a2f0fef623')
# the default gleam project template depends on gleeunit, which depends on
# erlang-eunit, so we make it a dependency to prevent confusing errors
depends=('erlang-core' 'erlang-eunit')
# the full erlang distribution depends on a graphical stack, so it's listed as
# optional, but some gleam packages may depend on parts of it
optdepends=('rebar3: erlang dependency support'
            'erlang: standard erlang distribution')

package() {
  install -Dm 755 "$srcdir/gleam" "$pkgdir/usr/bin/gleam"
}
