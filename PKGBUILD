# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Harley Wiltzer <harleyw@hotmail.com>
# Contributor: Filip Grali?ski <filipg at ceti dot pl>
# Contributor: Andrei Shadrikov <notvuvko@gmail.com>

pkgname='python-hydra'
pkgver='1.1.1'
pkgrel=1
pkgdesc='A framework for elegantly configuring complex applications'
arch=('any')
url='https://hydra.cc'
license=('MIT')
depends=('python-omegaconf')
provides=('python-hydra')
source=("$pkgname-$pkgver::https://github.com/facebookresearch/hydra/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('03840c5192d47c3b0a4cf57e1815f8626d36f2fed81efed59202f6bd93ac822c')

_pkgname=${pkgname/python-/}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root "$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
