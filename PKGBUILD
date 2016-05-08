# Maintainer: uberushaximus <uberushaximus@gmail.com>

pkgname=limf-git
pkgver=140
pkgrel=1
pkgdesc="A tool for uploading files to pomf.se clones"
url="http://github.com/lich/limf"
depends=('python' 'python-requests')
makedepends=('git')
license=('MIT')
arch=('any')
source=('git+https://github.com/lich/limf.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/limf
  git rev-list --count HEAD
}

build() {
    cd $srcdir/limf
    python setup.py build
}

package() {
    cd $srcdir/limf
    python setup.py install --root="$pkgdir" --optimize=1 
}
