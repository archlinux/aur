# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor:anon at sansorgan.es
pkgname=awx
pkgver=17.0.1
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache')
depends=('python2' 'gettext')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('213894acb77a058c6be6bf95bd80149023e9e8ba8f79f627bd41b35d21c9bdf2')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
