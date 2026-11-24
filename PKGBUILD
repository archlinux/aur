# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=streamdown-py
pkgver=0.36.9
pkgrel=1
pkgdesc="Streaming Markdown renderer for the terminal"
arch=('any')
url="https://github.com/day50-dev/streamdown"
license=('MIT')
depends=('python' 'python-appdirs' 'python-pygments' 'python-pylatexenc' 'python-toml' 'python-wcwidth')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
conflicts=('streamdown')
source=("https://files.pythonhosted.org/packages/source/s/streamdown/streamdown-${pkgver}.tar.gz")
sha256sums=('7377e2ee994091f3a975cfb7a1107a8e2107ec006de7a65f30573c6e91411057')

build() {
  cd "streamdown-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "streamdown-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
