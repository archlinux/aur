# Maintainer: Radu Potop <radu at wooptoo.com>

pkgname=pgmq
pkgver=1.9.0
pkgrel=1
pkgdesc="A lightweight message queue. Like AWS SQS and RSMQ but on Postgres."
arch=('x86_64')
url="https://github.com/pgmq/pgmq"
license=('MIT')
depends=('postgresql')
makedepends=('git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f5bd82e85967052b08c623503ce8acae81fcc699b1354f25fb8cf2c149cc09d')

package() {
    cd $srcdir/${pkgname}-${pkgver}/${pkgname}-extension
    make
    make install DESTDIR="$pkgdir"
}
