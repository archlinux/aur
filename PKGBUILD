# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=pocketenv
pkgver=0.7.0
pkgrel=1
pkgdesc="open, interoperable sandbox platform for agents and humans 📦 ✨"
arch=('x86_64')
url="https://github.com/pocketenv-io/pocketenv"
license=('MPL-2.0')
depends=('deno')
source=("git+https://github.com/pocketenv-io/pocketenv.git#tag=v$pkgver")
sha256sums=('SKIP')
options=('!strip') # stripping breaks the binary

build() {
    cd "$srcdir/$pkgname"
    deno compile --allow-all --output pocketenv npm:@pocketenv/cli
}

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname/pocketenv"
}
