# Maintainer: milkii on freenode
pkgname=oui-blendish-git
pkgver=r1.8704539
pkgrel=1
pkgdesc="Platform agnostic UI, NanoVG imitating the Blender 2.5, single C header file."
arch=("x86_64")
url="https://bitbucket.org/duangle/oui-blendish/src/default/"
license=('ZLIB')
groups=()
depends=()
makedepends=('git' 'premake' 'patch')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('git+https://github.com/alexesDev/oui-blendish')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd oui-blendish
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd oui-blendish
}

build() {
  cd oui-blendish
}

package() {
  cd oui-blendish
	install -D oui.h ${pkgdir}/usr/include/oui.h
	install -D blendish.h ${pkgdir}/usr/include/blendish.h
}
