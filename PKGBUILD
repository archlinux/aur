# Author: Axujen <axujen@gmail.com>
# Maintainer: qlonik <volodin.n at gmail dot com>

_gitauthor=axujen
_gitname=mpdrandom
pkgname=mpdrandom-git
pkgver=1.1.r5.geb67e9a
pkgrel=1
pkgdesc="mpd albums randomizing script"
arch=('any')
url="https://github.com/$_gitauthor/$_gitname"
license=('unknown')
depends=('python' 'python-mpd2')
makedepends=('git')
provides=('mpdrandom')
source=('git+https://github.com/axujen/mpdrandom')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
