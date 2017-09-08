# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=awx
pkgver=1.0.0
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache-2.0')
depends=('python2' 'gettext')
options=(!emptydirs)
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('592bb7420dfb952e43fb9dce1731a4c03d98adc036a86fc1b60728d65511cb41')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
