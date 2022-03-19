# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>
_pkgname=pidgin-tts
pkgname=pidgin-espeak-git
pkgver=2019_11_20..210876f
pkgrel=1
pkgdesc="espeak plugin for the pidgin IM"
arch=('any')
url="https://github.com/coldfix/pidgin-tts"
license=('WTFPL')
depends=('pidgin' 'espeak')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/coldfix/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd..%h' --date=short | tr - _
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  PREFIX="$pkgdir/usr" make install
}

# vim:set ts=2 sw=2 et:
