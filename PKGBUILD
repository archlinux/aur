# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Oleg Finkelshteyn <olegfink@gmail.com>
pkgname=picocom-git
_pkgname=picocom
pkgver=r416.7b6acbd
pkgrel=2
arch=(x86_64 i686)
pkgdesc='Minimal dumb-terminal emulation program, very much like minicom. Development version'
url='https://gitlab.com/wsakernel/picocom'
license=(GPL2)
source=('git+https://gitlab.com/wsakernel/picocom.git')
makedepends=(git go-md2man)
conflicts=(picocom)
provides=(picocom)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  make all doc
}

package() {
  cd $_pkgname
  install -D -m 755 picocom "$pkgdir/usr/bin/picocom"
  install -D -m 644 picocom.1 "$pkgdir/usr/share/man/man1/picocom.1"
}

md5sums=('SKIP')
