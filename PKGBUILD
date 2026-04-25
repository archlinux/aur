# Maintainer: Radu Potop <radu at wooptoo.com>

pkgname=pgmq
pkgver=1.11.1
pkgrel=1
pkgdesc="A lightweight message queue. Like AWS SQS and RSMQ but on Postgres."
arch=('x86_64')
url="https://github.com/pgmq/pgmq"
license=('MIT')
depends=('postgresql')
makedepends=('git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d2d81ec7bf4d1efaeabe1363063f1ec8ab839f1dd2fd94ab901e4507dacb4b8')

package() {
    cd $srcdir/${pkgname}-${pkgver}/${pkgname}-extension
    make
    make install DESTDIR="$pkgdir"
}
