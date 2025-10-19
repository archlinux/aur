# Maintainer: mia <mia@mia.jetzt>

pkgname='gleam-bin'
pkgver='1.13.0'
pkgrel='1'
pkgdesc='A friendly language for building type-safe, scalable systems!'
arch=('x86_64')
url='https://gleam.run'
license=('Apache-2.0')
provides=('gleam')
conflicts=('gleam')
source=("https://github.com/gleam-lang/gleam/releases/download/v$pkgver/gleam-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('8b372488e5ccaa54d8acc2feb9852c9e7916e480566049edd565caa1d8c74eec')
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
