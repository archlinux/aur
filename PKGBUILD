# Maintainer: Jaryl Chng <mrciku@gmail.com>
pkgname=js2xbox-git
pkgver=20170212.39de55d
pkgrel=1
pkgdesc='Simple user space driver to create a virtual Xbox 360 joypad from an existing one'
arch=('any')
url='https://github.com/Emanem/js2xbox'
license=('GPL3')
provides=('js2xbox-git')
conflicts=('js2xbox')
groups=()
depends=()
makedepends=('gcc')
optdepends=()
options=()
source=('git+https://github.com/Emanem/js2xbox.git')
sha1sums=('SKIP')

_gitname="js2xbox"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$_gitname"

  make
}

package() {
  cd "$_gitname"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "js2xbox" "$pkgdir/usr/bin/js2xbox"
}