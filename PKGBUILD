# Maintainer: Charlie Stanton <charlie@shtanton.com>
pkgname=gmi2html
pkgver=0.4.0
pkgrel=1
pkgdesc="Translate text/gemini to HTML"
arch=("x86_64")
url="https://github.com/shtanton/gmi2html"
license=("MIT")
groups=()
depends=()
makedepends=("zig=0.8.0" "scdoc")
source=("https://github.com/shtanton/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("6ffb8fba730109d8a2b42e6ab4056b51")

package() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-small -Dstrip --prefix "${pkgdir}/usr" install
    scdoc < doc/gmi2html.scdoc > doc/gmi2html.1
    install -D doc/gmi2html.1 "${pkgdir}/usr/share/man/man1/gmi2html.1"
}
