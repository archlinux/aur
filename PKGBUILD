# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hike
pkgver=1.4.0
pkgrel=1
pkgdesc="Markdown browser for the terminal"
arch=('any')
url="https://github.com/davep/hike"
license=('GPL-3.0-only')
depends=('python' 'python-httpx' 'python-pyperclip' 'python-textual' 'python-textual-enhanced' 'python-textual-fspicker' 'python-typing_extensions' 'python-xdg-base-dirs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/h/hike/hike-${pkgver}.tar.gz")
sha256sums=('e9acdadac5c439aa788a2fc4aae2f0ddb61047c7f2d3654bdd2d8040a92c33c2')

build() {
  cd "hike-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "hike-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
