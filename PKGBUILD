# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contibutor: Morten Linderud <foxboron@archlinux.org>
# Contibutor: Alexandre Pujol <alexandre@pujol.io>

_pkgname='pass-steam'
pkgname='pass-steam-git'
pkgver=6bb1a5b
pkgrel=1
pkgdesc='A pass extension for managing Steam Guard codes'
arch=('any')
url='https://github.com/vanyasem/pass-steam'
license=('GPL3')
depends=(pass python-steam)
source=("git://github.com/vanyasem/pass-steam")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git describe --always)"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
