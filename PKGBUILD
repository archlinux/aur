# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=rexi
pkgver=1.1.3
pkgrel=1
pkgdesc="Terminal UI for Regex Testing"
arch=('any')
url="https://github.com/royreznik/rexi"
license=('MIT')
depends=('python-typer' 'python-textual' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('25e6b24cfee83c6dd0dd897c940c4ca209f0f836f5fbf5da4a3f4ebae41af7c3da6ab7ad806da017e8a45c81f2159c0c793298c3b8a9a1fca1f093c71ac5a749')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:

