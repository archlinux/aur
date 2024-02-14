# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor:anon at sansorgan.es
pkgname=awx
pkgver=23.8.0
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache')
depends=('python' 'gettext')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('389017d59f7ca6846b22a91be4facc77e32c407600d299a30600e812ec639a0d')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  echo "${pkgver}" > VERSION
  python -c "from setuptools import setup; setup();" build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: 
