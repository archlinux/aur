# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=fluentci
pkgver=0.16.5
pkgrel=1
pkgdesc="Set up and run your CI locally or in any CI Provider in a consistent way"
arch=('x86_64')
url="https://github.com/fluentci-io/fluentci"
license=('MPL-2.0')
depends=('deno')
source=("git+https://github.com/fluentci-io/fluentci.git#tag=v$pkgver")
sha256sums=('SKIP')
options=('!strip') # stripping breaks the binary

build() {
    cd "$srcdir/$pkgname"
    deno compile -A --no-check -o fluentci main.ts
}

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname/fluentci"
}
