# Maintainer: Tomek Łaziuk <tlaziuk@gmail.com>

_pkgname=ffautocrop
pkgname=$_pkgname-git
pkgver=0.0.1.r1.gd443c30
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

  install -Dm664 README.md       "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm755 $_pkgname        "$pkgdir/usr/bin/${_pkgname}"
}
