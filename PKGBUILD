# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=alibuild
pkgver=1.8.2
pkgrel=1
pkgdesc='A simple build tool for ALICE software at CERN'
arch=('i686' 'x86_64')
url='https://alisw.github.io/alibuild/'
license=('GPL3')
depends=('python' 'python-requests' 'python-yaml' 'python-distro')
optdepends=('s3cmd: for the S3 remote store')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e053de1d6cdfa153d008baf9b4da2623d2950fc68222783788ce5c9c089349b')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # Tests are currently broken on Arch because we need --force-unknown-architecture.
  #python -m unittest discover tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
