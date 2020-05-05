pkgname=newsboat-sendmail
pkgver=1.1
pkgrel=1
pkgdesc="A companion script that sends unread RSS items in Newsboat through email"
arch=("any")
url="https://github.com/lenormf/newsboat-sendmail"
license=("MIT")
depends=("newsboat" "python" "python-beautifulsoup4")
makedepends=()
source=("https://github.com/lenormf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("71cb47197bab71b2554d5dda025a7c4bdddce5dad2d07abf00ddf36706a752ac")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    gzip newsboat-sendmail.1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D newsboat-sendmail.1.gz "${pkgdir}"/usr/share/man/man1/newsboat-sendmail.1.gz
    install -D newsboat-sendmail.py "${pkgdir}"/usr/bin/newsboat-sendmail
    install -D LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
