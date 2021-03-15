# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.6
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v${pkgver}.tar.gz")
sha256sums=('d97c373e00bc29919488dccecf67dec7535e0c68fb48d8eac92bd8338c567fb8')
b2sums=('7541422317f8d2b55ed2fed01ad6a69cdcac04f80df76c7a1ad9929a56e89b2934032e61aba717745a7b7c40ed4ee9ea92f2a2ec8e65556a0f3a6229c4e5674e')

check() {
  cd "rtoml-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "rtoml-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
