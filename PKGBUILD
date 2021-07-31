# Maintainer: robertfoster

pkgname=soundcloud-dl-git
pkgver=v1.3.3b1.r163.g6dd6ef7
pkgrel=2
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
arch=(any)
depends=(
  'python-clint'
  'python-docopt'
  'python-mutagen'
  'python-simplejson'
  'python-termcolor'
  'python-requests'
)
makedepends=(git python-setuptools)
source=("$pkgname::git+https://github.com/flyingrub/scdl.git")
license=(GPL2)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir"
}

md5sums=('SKIP')
