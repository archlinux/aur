# Maintainer: Lukas Šupienis <lukassup at yahoo dot com>

pkgname=gns3-converter-git
pkgver=1.3.0
pkgrel=1
pkgdesc='GNS3 topology converter (git version).'
arch=('any')
url='https://github.com/GNS3/gns3-converter'
license=('GPL3')
groups=('gns3')
makedepends=('git' 'python-setuptools')
depends=('python-configobj' 'python-cx_freeze')
source=("git+https://github.com/GNS3/${pkgname}.git")
md5sums=('SKIP')

prepare() {
  cd ${srcdir}/${pkgname}
  git checkout v${pkgver}
}

package() {
  cd ${srcdir}/${pkgname}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
