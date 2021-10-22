# Maintainer Vova Abdrakhmanov <369565@gmail.com>

pkgname=gala-layoutpw-plugin
pkgver=6.1.0
pkgrel=1
pkgdesc='Gala plugin to switch layouts per window'
arch=('x86_64')
url='https://github.com/Dirli/gala-layoutpw-plugin'
license=('GPL3')
depends=('glib2' 'glibc' 'libgee' 'gala' )
makedepends=('meson' 'vala')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dirli/gala-layoutpw-plugin/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('7a3039cdc90967b589936d1d7190433c3c74c6fb222654b72ec47e3c51a9a5c4')
install='install.sh'

build() {
  arch-meson ${pkgname}-${pkgver} build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

#vim: syntax=sh
