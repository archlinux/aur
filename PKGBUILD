# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sqlitebiter
pkgver=0.34.0
pkgrel=2
pkgdesc='Convert CSV, Excel, HTML, JSON, Jupyter Notebook, LDJSON, LTSV, Markdown, SSV, TSV, Google-Sheets to SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqlitebiter'
license=('MIT')
depends=('jupyter-nbformat'
        'python'
        'python-appconfigpy'
        'python-click'
        'python-dataproperty'
        'python-envinfopy'
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
sha256sums=('e368036cfdda09970c15bdc0bc220b9e5206182ebd41539a1da85fad69513ab7')

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
