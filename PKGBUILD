  # Maintainer: Kevin Roleke <kevin@zerogon.consulting>
  pkgname=gpufetch
  pkgver=0.3.0
  pkgrel=1
  pkgdesc="A minimal GPU monitor for your terminal"
  arch=('any')
  url="https://github.com/kevinroleke/gpufetch"
  license=('MIT')
  depends=('python')
  makedepends=('python-build' 'python-installer' 'python-wheel')
  source=("https://files.pythonhosted.org/packages/source/g/gpufetch/gpufetch-${pkgver}.tar.gz")
  sha256sums=('365fd7906865a1f09f9fd74c2ebea052c2466b8163abcd214051bf5f9d639ea5')

  build() {
    cd "gpufetch-${pkgver}"
    python -m build --wheel --no-isolation
  }

  package() {
    cd "gpufetch-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
  }

