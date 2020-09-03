# Maintainer: Janis Jansons <aur@janhouse.lv>
pkgname=cecdaemon-git
pkgver=1.0.0.r2.gd99aea3
pkgrel=1
pkgdesc="CEC Daemon for linux media centers"
arch=('any')
url="https://github.com/simons-public/cecdaemon"
license=('BSD')
depends=('python' 'libcec' 'python-cec-git' 'python-uinput')
provides=('cecdaemon')
conflicts=('cecdaemon')
makedepends=('git' 'python-setuptools')
source=("cecdaemon-git::git+https://github.com/simons-public/cecdaemon.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    python setup.py build
}

package() {
    cd $srcdir/$pkgname
    python setup.py install --root="$pkgdir"
}
