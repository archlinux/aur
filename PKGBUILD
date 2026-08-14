# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=2026.8.14.0
pkgrel=1
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('BSD')
depends=('python' 'pdftk' 'poppler' 'ghostscript' 'python-pypdf')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pip')
checkdepends=('python-nose')
source=(https://files.pythonhosted.org/packages/7f/d0/d63aa6e322440423680fffe1b5d7569e986e0ac982841a5aa4c102833a3f/pdfknife-${pkgver}.tar.gz)
sha256sums=('845346a53a44a921be7d5fe27a954f817c40a3483ef7a02f376f78cd2936e9df')

build() {
  cd "$srcdir/pdfknife-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/pdfknife-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:ts=2:sw=2:et:
