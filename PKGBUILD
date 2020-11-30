pkgname=sendmail-tryqueue
pkgver=2.0
pkgrel=1
pkgdesc="A generic utility that caches/queues emails that couldn't be sent"
arch=("any")
url="https://github.com/lenormf/sendmail-tryqueue"
license=("MIT")
depends=("python")
makedepends=()
source=("https://github.com/lenormf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("72a3aac19ac061cd6882a6460b7e094633db174ddef0c9f772c6731ce80a0cb7")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    gzip -f sendmail-tryqueue.1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D sendmail-tryqueue.1.gz "${pkgdir}"/usr/share/man/man1/sendmail-tryqueue.1.gz
    install -D -m755 sendmail-tryqueue.py "${pkgdir}"/usr/bin/sendmail-tryqueue
    install -D LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
