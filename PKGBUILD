# Maintainer: Mathieu "MatToufoutu" Deous <mattoufootu+aur@gmail.com>

pkgname=kalibrate-hackrf-git
_pkgname=kalibrate-hackrf
pkgver=20150303
pkgrel=1
pkgdesc="GSM base stations scanner (for HackRF)"
arch=('i686' 'x86_64')
url="https://github.com/scateu/kalibrate-hackrf"
license=()
depends=(git)
makedepends=(gcc make)
source=(git+https://github.com/scateu/${_pkgname})
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

