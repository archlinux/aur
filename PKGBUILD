# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: zach <zach {at} zach-adams {dot} com>

pkgname=imgp-git
_pkgname=imgp
epoch=1
pkgver=v3.0.r1.g8a3de39
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images."
arch=('any')
url="https://github.com/jarun/${_pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/jarun/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('imgp')
provides=('imgp')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
