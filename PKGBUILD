 # Maintainer: Luca Fulgenzi <fulgenzi.luca@gmail.com>
  pkgname=python-seppia
  pkgver=0.1.0
  pkgrel=1
  pkgdesc='Seppia — personal assistant CLI'
  arch=('any')
  url='https://github.com/lucafulgenzi/seppia'
  license=('MIT')
  depends=('python' 'python-typer' 'python-rich' 'python-httpx' 'python-websockets')
  makedepends=('python-build' 'python-installer' 'python-hatchling')
  source=("https://files.pythonhosted.org/packages/source/s/seppia/seppia-${pkgver}.tar.gz")
  sha256sums=('SKIP')

  build() {
    cd "seppia-${pkgver}"
    python -m build --wheel --no-isolation
  }

  package() {
    cd "seppia-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
  }
