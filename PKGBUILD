# Maintainer: Charlie Stanton <charlie@shtanton.com>
pkgname=gmi2html
pkgver=0.2.1
pkgrel=1
pkgdesc="Translate text/gemini to HTML"
arch=("x86_64")
url="https://github.com/shtanton/gmi2html"
license=("MIT")
groups=()
depends=()
makedepends=("zig>=0.7.0", "zig<=0.7.1", "scdoc")
source=("https://github.com/shtanton/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("bb931790753ae754720fcbdff259f301")

package() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-small -Dstrip --prefix "${pkgdir}/usr" install
    scdoc < doc/gmi2html.scdoc > doc/gmi2html.1
    install -D doc/gmi2html.1 "${pkgdir}/usr/share/man/man1/gmi2html.1"
}
