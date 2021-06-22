# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=alibuild
pkgver=1.8.5
pkgrel=1
pkgdesc='A simple build tool for ALICE software at CERN'
arch=(i686 x86_64)
url='https://alisw.github.io/alibuild/'
license=(GPL3)
depends=(python python-requests python-yaml python-distro git)
optdepends=('s3cmd: for the S3 remote store')
source=("https://github.com/alisw/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9775d102674e8f754b74191553f8a4b8daa7360ebd8fe87197b46831de42e45')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m unittest discover tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
