# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sqlitebiter
pkgver=0.33.0
pkgrel=1
pkgdesc='Convert CSV, Excel, HTML, JSON, Jupyter Notebook, LDJSON, LTSV, Markdown, SSV, TSV, Google-Sheets to SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqlitebiter'
license=('MIT')
depends=('jupyter-nbformat'
         'python-appconfigpy'
         'python-click'
         'python-dataproperty'
         'python-loguru'
         'python-msgfy'
         'python-path'
         'python-pathvalidate'
         'python-pytablereader'
         'python-retryrequests'
         'python-simplesqlite'
         'python-tcolorpy'
         'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('76300076401a1c6fc9833810b13aeb587bc742657bc41c30e32a815cf35b2400')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
