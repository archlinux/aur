# Maintainer: gilcu3
# Contributor: gilcu3

_pkgname=deep-translator
pkgname=python-$_pkgname-git
pkgver=1.1.14
pkgrel=3
pkgdesc="A flexible FREE and UNLIMITED tool to translate between different languages in a simple way using multiple translators."
url="https://github.com/nidhaloff/deep-translator"
license=("Apache-2.0")
arch=("any")
makedepends=('git' 'python-build' 'python-poetry')
depends=('python' 'python-beautifulsoup4' 'python-requests')
optdepends=('python-openai' 'python-docx2txt' 'python-pypdf')
checkdepends=('python-pytest')
provides=('python-deep-translator')
conflicts=('python-deep-translator')
source=(git+$url)
sha256sums=('SKIP')


build() {
  cd $srcdir/${_pkgname}
  python -m build --wheel --no-isolation
}

check() {
  cd $srcdir/${_pkgname}
  pytest
}

package() {
  cd $srcdir/${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}




