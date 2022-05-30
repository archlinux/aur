# Maintainer: robertfoster

pkgname=soundcloud-dl-git
pkgver=v2.7.1.r0.gb7c0c44
pkgrel=1
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
arch=(any)
depends=(
  'python-clint'
  'python-docopt'
  'python-mutagen'
  'python-pathvalidate'
  'python-requests'
  'python-simplejson'
  'python-soundcloud-v2'
  'python-termcolor'
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

sha256sums=('SKIP')
