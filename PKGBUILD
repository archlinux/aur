# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python2-gudev
_gitname=python-gudev
pkgver=147.2
pkgrel=8
pkgdesc="Python binding to the GUDev udev helper library"
arch=('x86_64')
url="https://github.com/nzjrs/python-gudev"
license=('LGPL3')
depends=('libgudev')
makedepends=('python2-gobject2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/nzjrs/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('aabb342ee944805d4038040242d45f49c9a13d0b92cb435394e9851cab99b6a55e2d7c65cb6291903e8482ccabfce552660520df69919635d20846d8db099583')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  PYTHON=python2 ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

