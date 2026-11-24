# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=searxngr
pkgver=0.9.0
pkgrel=1
pkgdesc="SearXNG search from the command line, inspired by ddgr and googler"
arch=('any')
url="https://github.com/scross01/searxngr"
license=('MIT')
depends=('python' 'python-babel' 'python-beautifulsoup4' 'python-dateutil' 'python-html2text' 'python-httpx' 'python-prompt_toolkit' 'python-pyperclip' 'python-rich' 'python-xdg-base-dirs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scross01/searxngr/archive/v${pkgver}.tar.gz")
sha256sums=('c6eaf8581fedd12f1cb917d44ed85bfe4d1ca31b9536eabcc5775f01319bb174')

build() {
  cd "searxngr-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "searxngr-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
