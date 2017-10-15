# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkgname=python-bullettrain

pkgname="$_pkgname-git"
pkgver=r32.750dc8c
pkgrel=1
pkgdesc='Bullettrain prompt builder written in Python'
url='https://github.com/jtyr/python-bullettrain'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=("python-setuptools")
depends=("python")
depends=('nerd-fonts-complete')
source=("git+https://github.com/jtyr/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
