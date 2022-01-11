# Maintainer Vova Abdrakhmanov <369565@gmail.com>

pkgname=gala-layoutpw-plugin
pkgver=6.3.0
pkgrel=3
pkgdesc='Gala plugin to switch layouts per window'
arch=('x86_64')
url='https://github.com/Dirli/gala-layoutpw-plugin'
license=('GPL3')
depends=('glib2' 'glibc' 'libgee' 'gala' )
makedepends=('meson' 'vala')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Dirli/gala-layoutpw-plugin/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('85b6544f9d362d98bc9cb6420d861476e8bbc26758d456597391a06fa04e6291')
install='install.sh'

build() {
  arch-meson ${pkgname}-${pkgver} build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

#vim: syntax=sh
