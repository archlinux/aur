# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=ePad
pkgname=${_pkgname,,}-git
pkgver=0.5.7.r53.618f5ac
pkgrel=1
pkgdesc="Simple text editor using Python and EFL"
arch=('any')
url="https://github.com/JeffHoogland/ePad"
license=('GPL3')
depends=('python-efl')
makedepends=('git')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
source=("git://github.com/JeffHoogland/ePad.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F '"' '/^__version__/ {print $2}' ePad.py)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$_pkgname/ePad.py" "$pkgdir/usr/bin/ePad.py"
}
