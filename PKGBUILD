# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ansible-lint-junit'
pkgname="python-${pkgbase}"
pkgver='0.17.8'
pkgrel='1'
pkgdesc='ansible-lint to JUnit converter'
arch=('any')
url="https://github.com/wasilak/${pkgbase}"
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-lxml')
depends=('ansible-lint' 'python-lxml')
license=('BSD')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c3bc56934d5329195c5157d0df04c2b27b82f8b0c6ea977516597a0a08690305')

build() {
  cd "${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgbase}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/"*".whl"
  install -Dm0644 "LICENSE.txt" "${pkgdir}/usr/share/doc/${pkgbase}/LICENSE"
}
