# Maintainer: Radu Potop <radu at wooptoo.com>

pkgname=pgmq
pkgver=1.13.0
pkgrel=1
pkgdesc="A lightweight message queue. Like AWS SQS and RSMQ but on Postgres."
arch=('x86_64')
url="https://github.com/pgmq/pgmq"
license=('MIT')
depends=('postgresql')
makedepends=('git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c980705ffa2a731b69f3d26be5650d6fbcc76b2b9add67b138da4ee74a4579a5')

package() {
    cd $srcdir/${pkgname}-${pkgver}/${pkgname}-extension
    make
    make install DESTDIR="$pkgdir"
}
