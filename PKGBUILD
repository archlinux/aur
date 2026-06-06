# Maintainer: xhdndmm <xhdndmm@gmail.com>

pkgname=123pan-cli-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="123pan-cli-bin"
arch=('x86_64')
url="https://github.com/123panNextGen/123pan-cli"
license=('MIT')

source=(
  "123pan-cli.zip::https://github.com/123panNextGen/123pan-cli/releases/download/v${pkgver}/123pan-cli-linux.zip"
)

sha256sums=('1e413f036bd6e3781b4890408d3ef54e52e7830e69bd1458857142a8663f9732')

package() {
    install -dm755 "$pkgdir/opt/123pan-cli"

    cp -r "$srcdir/"123pan-cli \
          "$pkgdir/opt/123pan-cli/"

    install -dm755 "$pkgdir/usr/bin"

    ln -s \
        /opt/123pan/123pan-cli \
        "$pkgdir/usr/bin/123pan-cli"
}
