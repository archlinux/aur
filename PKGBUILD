pkgname=mdevd
pkgver=0.1.4.0
pkgrel=1
pkgdesc="A small daemon managing kernel hotplug events, similarly to udevd."
arch=('x86_64')
url=https://skarnet.org/software/mdevd/
license=('ISC')
depends=('skalibs')
optdepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ffd3b223b4cf0e51253b4a8f09cb88d70bf22693228ab0818af174a3f099dcd2')

build() {
   cd "${pkgname}-${pkgver}"
   ./configure --prefix=/usr
   make
}

package() {
   cd "${pkgname}-${pkgver}"
   make DESTDIR="$pkgdir" install
   install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
