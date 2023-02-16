pkgname=mdevd
pkgver=0.1.6.1
pkgrel=1
pkgdesc="A small daemon managing kernel hotplug events, similarly to udevd."
arch=('x86_64')
url=https://skarnet.org/software/mdevd/
license=('ISC')
depends=('skalibs>=2.13.0.0')
optdepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5c01e4e79416db6cd993ef8a9014628b8f1f0b6c643275988488512faa5404b1')

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
