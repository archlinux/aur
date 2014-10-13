# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=ePad
pkgname=${_pkgname,,}-git
pkgver=r22.0c6abff
pkgrel=1
pkgdesc="Simple text editor using Python and EFL"
arch=('any')
url="https://github.com/JeffHoogland/ePad"
license=('unknown')
depends=('python-efl')
makedepends=('git')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=("git://github.com/JeffHoogland/ePad.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "$srcdir/$_pkgname/ePad.py" "$pkgdir/usr/bin/ePad.py"
}
