pkgname=mdevd
pkgver=0.1.5.0
pkgrel=1
pkgdesc="A small daemon managing kernel hotplug events, similarly to udevd."
arch=('x86_64')
url=https://skarnet.org/software/mdevd/
license=('ISC')
depends=('skalibs>=2.11.0.0')
optdepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c012037c80c4596c5d4549aff5fd9e5cf84e8c01a1d1959b8c7c94baecebd307')

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
