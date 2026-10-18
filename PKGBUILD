# Maintainer: Nicholas Jordan
pkgname=blackbeard-gtk-themes
pkgver=1.1.0
pkgrel=1
pkgdesc="Blackbeard dark and light GTK 2/3/4 and GNOME Shell themes"
arch=('any')
url="https://github.com/cvusmo/blackbeard-theme"
license=('0BSD')
optdepends=('gimp: build the optional GIMP theme with the upstream installer')
makedepends=('git' 'dart-sass>=1.95' 'python')
source=("git+https://github.com/cvusmo/blackbeard-theme.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/blackbeard-theme"
  ./build.sh
}

package() {
  cd "${srcdir}/blackbeard-theme"
  install -dm755 "${pkgdir}/usr/share/themes"
  cp -a dist/blackbeard-{dark,light} "${pkgdir}/usr/share/themes/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
