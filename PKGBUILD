# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=python-pyvoc
pkgver=1.4.0
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="Dictionary and vocabulary building command line tool"
url="https://github.com/makkoncept/pyvoc"
depends=('python-colorama' 'python-pyenchant' 'python-requests' 'python-termcolor')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makkoncept/pyvoc/archive/v${pkgver}.tar.gz")
b2sums=('ed51d5ae2686cdbe700607266d990f0b157f185090b68b461a61e719df43a2a43a9ca4a4e8287c889dd80f7e6cb22cd2f34cca12897eec46677c7820b943afce')

build() {
  cd "pyvoc-$pkgver"
  python setup.py build
}

package() {
  cd "pyvoc-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
