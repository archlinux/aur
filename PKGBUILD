# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor:anon at sansorgan.es
pkgname=awx
pkgver=19.5.1
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache')
depends=('python' 'gettext')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f65e333aa5f5ad27df28b474e5d14db5dc266b814565666a9b8d6449ff80d554')

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
