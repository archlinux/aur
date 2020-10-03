# Maintainer: Cullen Ross <cullenrss@gmail.com>

_pkgname='colorpicker'
pkgname="${_pkgname}-ym1234-git"
pkgver=r17.0e1c53c
pkgrel=1
pkgdesc='A small tool for X11 that writes the color value on your screen at the cursor position to stdout, in RGB'
arch=('i686' 'x86_64')
url="https://github.com/ym1234/${_pkgname}"
license=('MIT')
depends=('libx11')
makedepends=('make' 'git')
provides=('colorpicker')
conflicts=('colorpicker')
source=('git+https://github.com/ym1234/colorpicker')
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}/${_pkgname}"
  cd "${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
