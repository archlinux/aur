# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>

pkgname=python-pyzotero
pkgver=1.6.5
pkgrel=1
pkgdesc="A Python wrapper for the Zotero API"
arch=(any)
url="https://github.com/urschrei/pyzotero"
license=(BlueOak-1.0.0)
depends=(python-requests python-feedparser python-bibtexparser python-pytz)
makedepends=(python-build python-wheel python-installer python-setuptools-scm python-toml)
source=("https://github.com/urschrei/pyzotero/releases/download/v${pkgver}/pyzotero-${pkgver}.tar.gz")
sha512sums=('b6678ec47757c73241093afc9cb7556d90cd7566c0c877169ba3dac9466293d931294f08f6843a11f45584b3f9b20ff12b08d9359c9341cf3fad02ea2573d998')

build() {
  cd "pyzotero-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pyzotero-${pkgver}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
