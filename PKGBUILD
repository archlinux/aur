# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>

pkgname=python-pyzotero
pkgver=1.6.11
pkgrel=1
pkgdesc="A Python wrapper for the Zotero API"
arch=(any)
url="https://github.com/urschrei/pyzotero"
license=(BlueOak-1.0.0)
depends=(python-requests python-feedparser python-bibtexparser python-pytz)
makedepends=(python-build python-wheel python-installer python-setuptools-scm python-toml)
source=("https://github.com/urschrei/pyzotero/releases/download/v${pkgver}/pyzotero-${pkgver}.tar.gz")
sha512sums=('b90b67467ea80a6825857fd5ce159e6de495b554b4fe83800c2c5814e91b85803e107647da36fcd70660e0b6b409c348e3958a45890d127b53d90146826b5755')

build() {
  cd "pyzotero-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pyzotero-${pkgver}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
