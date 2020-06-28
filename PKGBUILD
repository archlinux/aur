pkgname=newsboat-sendmail
pkgver=2.1
pkgrel=1
pkgdesc="A companion script that sends unread RSS items in Newsboat through email"
arch=("any")
url="https://github.com/lenormf/newsboat-sendmail"
license=("MIT")
depends=("newsboat" "python" "python-beautifulsoup4")
makedepends=()
source=("https://github.com/lenormf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("c4673cf4c4bd28872aa4dcae2875840ddb83e16047a5735235ae1d6dbe0df1e0")

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
