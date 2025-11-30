# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: zach <zach {at} zach-adams {dot} com>

pkgname=imgp-git
_pkgname=imgp
pkgver=v2.9.r13.g00b2b52
pkgrel=2
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
