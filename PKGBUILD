# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=axon-applauncher
_pkgpyname=axon_applauncher
pkgver=1.0.3.3
pkgrel=1

pkgdesc="Hyper-customizable app launcher made in Python"
arch=('any')

url="https://github.com/wojtmic/axon"
license=('GPL3')

depends=('python' 'python-pyqt6' 'python-simpleeval' 'python-json5')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/wojtmic/axon/releases/download/v${pkgver}/v${pkgver}.tar.gz")

sha256sums=('972cd3f2efd888885a157c8080ad75b7ea0e4013d8073b65529c2563867cc27e')

build() {
  cd "$srcdir"
  python -m build --wheel --sdist --no-isolation --skip-dependency-check
}

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
