# Maintainer: Radu Potop <radu at wooptoo.com>

pkgname=pgmq
pkgver=1.13.1
pkgrel=1
pkgdesc="A lightweight message queue. Like AWS SQS and RSMQ but on Postgres."
arch=('x86_64')
url="https://github.com/pgmq/pgmq"
license=('MIT')
depends=('postgresql')
makedepends=('git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('67221f288f42f95c002a64df40f7d660e765e32df8ada0f2672ba915a14827f7')

package() {
    cd $srcdir/${pkgname}-${pkgver}/${pkgname}-extension
    make
    make install DESTDIR="$pkgdir"
}
