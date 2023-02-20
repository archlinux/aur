# Maintainer: jonas-w < aur at 03j dot de >
pkgname=h-m-m-git
pkgver=r136.8c4c8f8
pkgrel=1
pkgdesc="h-m-m is a keyboard-centric terminal-based tool for working with mind maps."
arch=('any')
url="https://github.com/nadrad/h-m-m"
license=('GPL3')
depends=('php')
optdepends=(
'xclip: clipboard support (x11)'
'xsel: clipboard support (x11)'
'wl-clipboard: clipboard support (wayland)'
)
source=("${pkgname}::git+https://github.com/nadrad/h-m-m")
md5sums=('SKIP')
pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
  cd "${srcdir}/${pkgname}"
  install -D -m755 h-m-m "${pkgdir}/usr/bin/h-m-m"
}
