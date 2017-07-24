# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgname=fprint_demo
pkgver=0.4
pkgrel=1
pkgdesc='A simple GTK+ application to demonstrate and test libfprint'"'"'s capabilities'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/fprint/fprint_demo/'
license=('GPL2')
depends=('gtk2' 'libfprint')
makedepends=(git)
groups=(fprint-git)
source=('https://github.com/dsd/fprint_demo/archive/v0.4.tar.gz')
md5sums=('41e78e420716f300b8776047b3c9fc5b')

build() {
  cd "${pkgname}-${pkgver}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
