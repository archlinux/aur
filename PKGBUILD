pkgname=ogmrip-oggz
pkgver=0.3
pkgrel=2
pkgdesc='Plugin for OGMRip which adds support for the OGG container for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'liboggz')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
)
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/$pkgname/README
}
sha256sums=('2af373774bb70fddd264a3319143aaa516df0cfe915363187308df430dec8b75'
            'b49079b1d79b9e1c9f14338fe6be2c561f3f169d1ec16cdfd55da420e10f9461')
