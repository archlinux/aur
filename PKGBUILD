# Maintainer: Radu Potop <radu at wooptoo.com>

pkgname=pgmq
pkgver=1.13.2
pkgrel=1
pkgdesc="A lightweight message queue. Like AWS SQS and RSMQ but on Postgres."
arch=('x86_64')
url="https://github.com/pgmq/pgmq"
license=('MIT')
depends=('postgresql')
makedepends=('git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a09f6db254a72a8b240f7071f8adf6540108cd959adf0f7ddfcfa118ee345ccc')

package() {
    cd $srcdir/${pkgname}-${pkgver}/${pkgname}-extension
    make
    make install DESTDIR="$pkgdir"
}
