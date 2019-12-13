# Maintainer:anon at sansorgan.es 
pkgname=awx
pkgver=9.0.0
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache')
depends=('python2' 'gettext')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('80d32315189065e78e2f394bebb620c6')
