# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=rexi
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal UI for Regex Testing"
arch=('any')
url="https://github.com/royreznik/rexi"
license=('MIT')
depends=('python-typer' 'python-textual' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a0221745dcb54925451b38614a2325c9ff35e53eb298a05f3d7b1cba521a587ceedd8914905530aa6e810e9f73de656fad9922b51361f676e3bfed8869cdb0ed')

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

