pkgname=opensnap-quicktile
pkgver=20180507
pkgrel=1
pkgdesc='Aero Snap Funcionality In Openbox with quicktile'
url='https://github.com/Pr0Wolf29/opensnap-quicktile'
arch=('i686' 'x86_64')
depends=('quicktile-git')
source=(git+https://github.com/Pr0Wolf29/opensnap-quicktile)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  sed -i 's!/usr/bin/!${DESTDIR}/usr/bin!' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname/bin"
  install -D -m 755 opensnap-quicktile "${pkgdir}/usr/bin/opensnap-quicktile"
}
