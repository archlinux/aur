# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=pffft-git
pkgver=r21.7c3b5a7
pkgrel=2
pkgdesc="A pretty fast 1D Fourier Transform, headers and sources"
arch=('x86_64')
url="https://bitbucket.org/jpommier/pffft/src/master/"
license=('custom:BSD-like')
source=("$pkgname::git+https://bitbucket.org/jpommier/pffft.git#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "$pkgdir/usr/include/pffft"
    cd "$srcdir/pffft-git"
    cp pffft.{c,h} "$pkgdir/usr/include/pffft"
}

