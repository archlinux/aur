# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=2026.7.28.1
pkgrel=1
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('BSD')
depends=('python' 'pdftk' 'poppler' 'ghostscript' 'python-pypdf')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pip')
checkdepends=('python-nose')
source=(https://files.pythonhosted.org/packages/97/09/38c759379caa5f273fa316754402c1c39a48a9985a8e6e916e0db1598438/pdfknife-${pkgver}.tar.gz)
sha256sums=('06eee652d78be4356527d250edb15155ff612de62adec99063c79e31ad3c53c1')

build() {
  cd "$srcdir/pdfknife-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/pdfknife-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:ts=2:sw=2:et:
