# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=gimp-lensfun
# commit from gimp-2.10 branch
_commit='1c5a5c1534b5faf098b7441f8840d22835592f17'
pkgver=0.2.4+9+gc5eaf97
pkgrel=1
pkgdesc='A Gimp plugin to correct lens distortion using the lensfun library and database'
arch=('i686' 'x86_64')
url='http://seebk.github.io/GIMP-Lensfun/'
license=('GPL')
depends=('gimp' 'lensfun' 'exiv2')
makedepends=('git')
source=("git+https://github.com/seebk/GIMP-Lensfun.git?commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/GIMP-Lensfun

  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ${srcdir}/GIMP-Lensfun

  make
}

package() {
  cd ${srcdir}/GIMP-Lensfun

  install -D -m0755 gimp-lensfun ${pkgdir}/usr/lib/gimp/2.0/plug-ins/gimp-lensfun

  install -D -m0644 CHANGES.txt ${pkgdir}/usr/share/doc/gimp-lensfun/CHANGES.txt
  install -D -m0644 LICENSE.txt ${pkgdir}/usr/share/doc/gimp-lensfun/LICENSE.txt
  install -D -m0644 README.txt ${pkgdir}/usr/share/doc/gimp-lensfun/README.txt
}

