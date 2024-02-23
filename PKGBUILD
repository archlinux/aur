# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=rexi
pkgver=1.1.2
pkgrel=1
pkgdesc="Terminal UI for Regex Testing"
arch=('any')
url="https://github.com/royreznik/rexi"
license=('MIT')
depends=('python-typer' 'python-textual' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b6a1eba0c394d6e2abbc8aec85ca420adf024ee5a5cfefeb678a853968ee12ca78e8a4bbda9e43651e846da13dda78e740c2815e6bbc315ab18479975d780f9d')

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

