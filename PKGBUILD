pkgname=newsboat-sendmail
pkgver=2.0
pkgrel=1
pkgdesc="A companion script that sends unread RSS items in Newsboat through email"
arch=("any")
url="https://github.com/lenormf/newsboat-sendmail"
license=("MIT")
depends=("newsboat" "python" "python-beautifulsoup4")
makedepends=()
source=("https://github.com/lenormf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("0ccf7a655bef1a20f109bc10fa51a6483b3285367716bda7d0c8f683630b4408")

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
