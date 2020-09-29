pkgname=newsboat-sendmail
pkgver=2.2
pkgrel=1
pkgdesc="A companion script that sends unread RSS items in Newsboat through email"
arch=("any")
url="https://github.com/lenormf/newsboat-sendmail"
license=("MIT")
depends=("newsboat" "python" "python-beautifulsoup4")
makedepends=()
source=("https://github.com/lenormf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("579c8245e62c78b16ec3786cf89136646bc9c05a0269966017208f3472c8b388")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    gzip -f newsboat-sendmail.1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D newsboat-sendmail.1.gz "${pkgdir}"/usr/share/man/man1/newsboat-sendmail.1.gz
    install -D -m755 newsboat-sendmail.py "${pkgdir}"/usr/bin/newsboat-sendmail
    install -D LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
