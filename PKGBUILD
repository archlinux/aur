# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=2026.7.27.0
pkgrel=1
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('BSD')
depends=('python' 'pdftk' 'poppler' 'ghostscript' 'python-pypdf')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pip')
checkdepends=('python-nose')
source=(https://files.pythonhosted.org/packages/49/9b/5ec08036ac1242d5da9700a135c71d3a727c4da474224d59821f6bd6caac/pdfknife-${pkgver}.tar.gz)
sha256sums=('70952d3c835d215a9f9dc108139bd01a19c1344f9888f72ff3525f5bbfbf2df1')

build() {
  cd "$srcdir/pdfknife-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/pdfknife-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:ts=2:sw=2:et:
