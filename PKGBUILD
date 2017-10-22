# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkgname=pbt

pkgname="$_pkgname-git"
pkgver=r46.dc5fc93
pkgrel=1
pkgdesc='Bullettrain prompt builder written in Python'
url='https://github.com/jtyr/pbt'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=("python-setuptools")
depends=("python")
optdepends=('nerd-fonts-complete')
conflicts=('pbt')
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
