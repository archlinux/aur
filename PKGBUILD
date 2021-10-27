# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=python-rtf_tokenize
pkgdesc="A simple RTF tokenizer."
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python')
makedepends=('python-pytest' 'python-setuptools')
url="https://github.com/benoit-pierre/rtf_tokenize"
source=("$pkgname-$pkgver.tar.gz::https://github.com/benoit-pierre/rtf_tokenize/archive/refs/tags/$pkgver.tar.gz")
sha1sums=(SKIP)

build() {
  cd "rtf_tokenize-$pkgver"
  python setup.py build_ext --inplace build
}

check() {
  cd "rtf_tokenize-$pkgver"
  python -m pytest
}

package() {
  cd "rtf_tokenize-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
