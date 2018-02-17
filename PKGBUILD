# Maintainer: Tomek Łaziuk <tlaziuk@gmail.com>

_pkgname=ffautocrop
pkgname=$_pkgname-git
pkgver=0.0.1.r0.g94c632c
pkgrel=1
pkgdesc="automatically crop a video using ffmpeg"
arch=("any")
url="https://github.com/tlaziuk/${_pkgname}"
license=('GPL')
depends=('ffmpeg')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/tlaziuk/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm755 $_pkgname        "$pkgdir/usr/bin/${_pkgname}"
}
