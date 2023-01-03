# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=dtimgextract-git
_gitname=${pkgname%-git}
pkgver=23.db133c1
pkgrel=1
pkgdesc="Tool to decompile a qualcomm dt.img into its split dtb files for the supported boards."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/s0be/dtimgextract"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('dtimgextract')
conflicts=('dtimgextract')
source=("git+https://github.com/s0be/dtimgextract")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  
  #gcc ${_gitname}.c -o ${_gitname}
  make all
}

package() {
  cd "${_gitname}"

  install -Dm755 ${srcdir}/${_gitname}/${_gitname} -t ${pkgdir}/usr/bin
}

# vim: set sw=2 ts=2 et:
