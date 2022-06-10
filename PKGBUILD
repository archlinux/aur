# Contributor: Olivier Medoc <o_medoc@yahoo.fr>
_base=libvhdi
pkgname=python2-${_base}
pkgver=20210425
pkgrel=1
pkgdesc="Library and tools to access the Virtual Hard Disk (VHD) image format"
url="https://github.com/libyal/${_base}"
arch=(any)
license=(LGPL)
depends=(python2)
makedepends=(python2-setuptools gcc)
source=(https://pypi.org/packages/source/${_base::1}/${_base}-python/${_base}-python-${pkgver}.tar.gz)
sha512sums=('105c0a6b8cf5d0202e219e87932887651f66ad9c14be000499dd9a35e8d314704cce6d74afc61044522e0c69576c094bfce4a4ad1a6258bc958229825b58c479')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
