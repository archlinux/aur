# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.7
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v${pkgver}.tar.gz")
sha256sums=('4d0755aff027c2238b123345911e5b1d0a2bdbe4ad3464e0651f59f4b08544da')
b2sums=('68776b4d0b73ac967f72e92b646b8830ded183ffefc72ca2394d4949102b93d44b8dff17067bce44783b43c6392c83115e2a47f7da0b08c8584cd63b772d165a')

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
