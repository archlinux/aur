# Maintainer: Fábio Melo Pfeifer <fmpfeifer@gmail.com>

pkgname=sleuthkit-apfs
pkgver=4.6.5
pkgrel=2
pkgdesc='File system and media management forensic analysis tools with APFS patches'
arch=('x86_64')
url="https://www.sleuthkit.org/sleuthkit"
license=('GPL2' 'CPL' 'custom:"IBM Public Licence"')
depends=('perl' 'libewf' 'sqlite')
provides=('sleuthkit')
conflicts=('sleuthkit')
source=('git+https://github.com/lfcnassif/sleuthkit-APFS.git')
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  ./bootstrap

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install

#licenses
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm0644 licenses/* "${pkgdir}"/usr/share/licenses/${pkgname}
}
