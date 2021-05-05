# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=logdna-cli-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='A command line tool for logdna'
url='https://github.com/logdna/logdna-cli'
license=('MIT')
arch=('x86_64')
provides=('logdna-cli')
source=("logdna-cli-$pkgver-$pkgrel.deb::https://github.com/logdna/logdna-cli/releases/download/${pkgver}/logdna-cli_${pkgver}_amd64.deb")
md5sums=('d5ff05d09c5d8b55f2ece7b931e5463f')
options=("!strip")
depends=('binutils' 'tar')
package() {
    ar x "$srcdir/logdna-cli-$pkgver-$pkgrel.deb" data.tar.gz
    tar -C "$srcdir" -xf data.tar.gz

    install -Dm 755 "$srcdir/usr/local/logdna/bin/logdna" "$pkgdir/usr/bin/logdna"
}
