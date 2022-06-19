pkgname=mdevd
pkgver=0.1.5.2
pkgrel=1
pkgdesc="A small daemon managing kernel hotplug events, similarly to udevd."
arch=('x86_64')
url=https://skarnet.org/software/mdevd/
license=('ISC')
depends=('skalibs>=2.11.0.0')
optdepends=('execline')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('460372b3d3bac9f3574156ed7e48618f9f4a361cb52c4494ad9063248ab4a4ff')

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
