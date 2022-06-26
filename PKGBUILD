# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname='python-hydra'
pkgver='2.5'
pkgrel=1
pkgdesc='A Python Bloomfilter'
arch=('any')
url='https://github.com/crankycoder/hydra'
license=('MIT')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/crankycoder/hydra/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7f52c19b083f3933a576beeb1a47f947bd62caf731d18dac576f0b6fc4382865')

_pkgname=hydra

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
