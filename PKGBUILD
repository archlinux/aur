pkgname=mdevd
pkgver=0.1.6.5
pkgrel=1
pkgdesc="A small daemon managing kernel hotplug events, similarly to udevd."
arch=('x86_64')
url=https://skarnet.org/software/mdevd/
license=('ISC')
depends=('skalibs>=2.14.3.0')
optdepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d5c86420c81b2e4720b41e4f48f727cd5d9a17f4e6317115d21c32099e72a628')

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
