# Maintainer: Kyli0x <kyli0x@protonmail.ch>

pkgname=kurcoder-git
pkgver=0.0.1.r36.g2572458
pkgrel=1
pkgdesc="Toolkit for encoding, decoding, checksums, hex conversions & IP calculations"
arch=('any')
url="https://github.com/0xkurome/kurcoder"
license=('MIT')
depends=('python' 'python-ipcalc')
makedepends=('git' 'python-setuptools')
conflicts=(kurcoder)
source=("git+$url")
md5sums=('SKIP')


pkgver() {
    cd "kurcoder"
    git describe --long  --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "kurcoder"
    python setup.py build
}

package() {
  cd "kurcoder"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/kurcoder-git/LICENSE"
}
