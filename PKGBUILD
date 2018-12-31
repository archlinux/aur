# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: David Manouchehri <manouchehri@riseup.net>

_gitname='alarm-fake-hwclock'
pkgname='fake-hwclock-git'
_gitbranch=master
_gitauthor=xanmanning
pkgver=v0.1b.r9.gee2d6c9
pkgrel=1
pkgdesc="Save/restore system clock on machines without working RTC hardware."
url="https://github.com/${_gitauthor}/${_gitname}"
license=('custom:Coffeeware')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('x86_64' 'armv5' 'armv6h' 'armv7h' 'aarch64')
makedepends=('git')

pkgver() {
  cd "${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}
