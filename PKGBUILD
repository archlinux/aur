# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=osxiv-git
_gitname=osxiv
pkgver=0.r1.c622573
pkgrel=1
pkgdesc='Overly Simple X Image Viewer'
url='https://github.com/Baitinq/osxiv.git'
arch=('any')
license=('GPL')
depends=()
makedepends=('git' 'sdl2' 'sdl2_image')
provides=('osxiv')

source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_gitname}"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_gitname}/${_gitname}"
}
