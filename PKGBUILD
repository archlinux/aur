pkgname=obsetlayout
pkgver=1.0
pkgrel=2
pkgdesc="A simple tool to set the desktop layout in Openbox."
arch=('i686' 'x86_64')
url="http://openbox.org/wiki/Help:FAQ#How_do_I_put_my_desktops_into_a_grid_layout_instead_of_a_single_row.3F"
license=('unknown')
provides=("${pkgname}=${pkgver}.${pkgrel}")
source=(http://openbox.org/dist/tools/setlayout.c)
sha512sums=('40f7913ecc1b5df9a931ab36a5d4cf47b59eba543fe8b21e4a2724e7cfdfe06814893d8ded8c7a1ce0082126ca89397de0521f9c265a57e376664042b63d612f')

build() {
  cd -- "$srcdir"
  gcc -o setlayout setlayout.c -lX11
}

package() {
  cd -- "$srcdir"
  install -Dm755 setlayout "$pkgdir/usr/bin/$pkgname"
}
