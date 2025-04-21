pkgname=krop
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL-3.0-or-later')
depends=('python' 'python-pypdf' 'python-pyqt6' 'python-pyqt6-sip' 'python-pymupdf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'sip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arminstraub/krop/archive/v${pkgver}.tar.gz")
sha256sums=('373cd802af7831935f2084cadaab65f5358680f976227e03df71c953eacdee61')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/krop/LICENSE"
}

