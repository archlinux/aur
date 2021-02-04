pkgname=sendmail-tryqueue
pkgver=2.1
pkgrel=1
pkgdesc="A generic utility that caches/queues emails that couldn't be sent"
arch=("any")
url="https://github.com/lenormf/sendmail-tryqueue"
license=("MIT")
depends=("python")
makedepends=()
source=("https://github.com/lenormf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("abc3a4329eb56fda4561ebb66ae3404e4c6f5176c28afd2e8774df84b321cc55")

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
