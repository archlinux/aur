# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gmanedit2
pkgver=0.4.2
pkgrel=1
pkgdesc='Gnome Manual Pages Editor is an editor for man pages that runs on X using the GTK+ libraries'
arch=('x86_64')
url='https://sourceforge.net/projects/gmanedit2'
provides=('gmanedit')
license=('GPL2')
depends=('gtk2')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/gmanedit2/files/gmanedit/gmanedit-${pkgver}/gmanedit-${pkgver}.tar.gz/download")
sha256sums=('fbfaa424653b9287ca2994293bab03d51fa4957cdb7e974360f50c4ab2c76170')

build() {
  cd "${pkgname%2}-${pkgver}"
  export LDFLAGS="-Wl,--copy-dt-needed-entries"
  ./configure --prefix=/usr
   make
}

package() {
  cd "${pkgname%2}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: