# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=edir
pkgver=2.39
pkgrel=1
pkgdesc="Program to rename, remove, and copy files and directories using your editor"
url="https://github.com/bulletmark/$pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python>=3.8" "python-argparse-from-file" "python-natsort")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('65489e8d6aa92e879d481fe0b269ac4b122e1a7c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
