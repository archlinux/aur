# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=pocketenv
pkgver=0.1.5
pkgrel=1
pkgdesc="Manage your development environment with ease ✨"
arch=('x86_64')
url="https://github.com/pocketenv-io/pocketenv"
license=('MPL-2.0')
depends=('deno')
source=("git+https://github.com/pocketenv-io/pocketenv.git#tag=v$pkgver")
sha256sums=('SKIP')
options=('!strip') # stripping breaks the binary

build() {
    cd "$srcdir/$pkgname"
    deno compile -A --no-check --unstable-kv -o pocketenv main.ts
}

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname/pocketenv"
}