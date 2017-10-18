# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
# Co-Maintainer: Nils Czernia <nils@czserver.de>
pkgname=awx
pkgver=1.0.1
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache-2.0')
depends=('python2' 'gettext')
options=(!emptydirs)
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('880787ecd6e31cd899fd17f79e170e0ce13693dae464e0c31ac7c852c2d0509e')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
