# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor:anon at sansorgan.es
pkgname=awx
pkgver=20.1.0
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache')
depends=('python' 'gettext')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c4daa92931dd7818a3a1cd396f5da09728b72170b55c90790fc53ad43391e2be')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  echo "${pkgver}" > VERSION
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
