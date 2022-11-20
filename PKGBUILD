# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-hypothesmith
pkgver=0.2.0
pkgrel=1
pkgdesc="Hypothesis strategies for generating Python programs, something like CSmith"
url="https://github.com/Zac-HD/hypothesmith"
license=('MPL')
arch=('any')
depends=('python38-hypothesis' 'python38-lark-parser' 'python38-libcst')
makedepends=('python38-setuptools')
checkdepends=('python38-black' 'python38-parso' 'python38-pytest-cov')
source=("https://pypi.io/packages/source/h/hypothesmith/hypothesmith-$pkgver.tar.gz")
sha512sums=('b82627897f0e07e6249ce2d3730134690dbe340b81632a1101b6b6b9a9ac6ccd0f350ba10f729349ef200b9243081f7f58eb760ccbcb4175adfcc5f411a8a045')

build() {
  cd hypothesmith-$pkgver
  python3.8 setup.py build
}

check() {
  cd hypothesmith-$pkgver
  PYTHONPATH="$PWD/build/lib" pytest
}

package() {
  cd hypothesmith-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
