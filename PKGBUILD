# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=alibuild
pkgver=1.8.3.rc1
pkgrel=1
pkgdesc='A simple build tool for ALICE software at CERN'
arch=(i686 x86_64)
url='https://alisw.github.io/alibuild/'
license=(GPL3)
depends=(python python-requests python-yaml python-distro git)
optdepends=('s3cmd: for the S3 remote store')
source=("https://github.com/alisw/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('011e99bc8674978e806c9fbb5c9866347e406ce3a7ec4b4fb9d4795652fbadfa')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m unittest discover tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
