pkgname=mdevd
pkgver=0.1.6.3
pkgrel=1
pkgdesc="A small daemon managing kernel hotplug events, similarly to udevd."
arch=('x86_64')
url=https://skarnet.org/software/mdevd/
license=('ISC')
depends=('skalibs>=2.13.0.0')
optdepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f6ecf0ef7cd48d04efc75acb2dad967d850bc8815bdb0098f1c9ef043394d430')

build() {
   cd "${pkgname}-${pkgver}"
   ./configure --prefix=/usr
   make clean all
}

package() {
   cd "${pkgname}-${pkgver}"
   make DESTDIR="$pkgdir" install
   install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
