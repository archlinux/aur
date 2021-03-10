# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor:anon at sansorgan.es
pkgname=awx
pkgver=17.1.0
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache')
depends=('python2' 'gettext')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('86aaf19dbbfea3e75508edc705f4a0d178cd46d4869ecced2edc779867541683')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
