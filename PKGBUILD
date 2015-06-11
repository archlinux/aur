# Maintainer: Carl George < arch at cgtx dot us >

pkgname="mkdocs"
pkgver="0.14.0"
pkgrel="1"
pkgdesc="Project documentation with Markdown."
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("flake8"
              "python-coverage"
              "python-nose"
              "python-mock")
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5c182d3c5b148fa574d0f9be4900480a9e8ceab5d1f89e49f5a2bae0245a493a')

package() {
    depends=("livereload>=2.3.2"
             "python-click>=4.0"
             "python-jinja>=2.7.1"
             "python-markdown>=2.3.1"
             "python-six>=1.4.0"
             "python-tornado>=4.1"
             "python-yaml>=3.10")
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
