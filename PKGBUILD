# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=devskim
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal feed reader for Hacker News, Reddit, Lobsters and GitHub Trending"
arch=('any')
url="https://github.com/emarkou/devskim"
license=('MIT')
depends=('python' 'python-click' 'python-httpx' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/d/devskim/devskim-${pkgver}.tar.gz")
sha256sums=('d6f36a13f0701d53e444c8fc2d2479d1ab8e4d07d460a23b5be11a9a60638a26')

build() {
  cd "devskim-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "devskim-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
