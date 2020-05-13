# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname='dynamic-wallpaper-editor'
pkgver='2.5'
pkgrel='1'
pkgdesc="A little utility for creation or edition of GNOME desktop's XML wallpapers"
changelog='CHANGELOG'
arch=('x86_64')
url="https://github.com/maoschanz/${pkgname}"
license=('GPL3')
depends=('python' 'hicolor-icon-theme')
makedepends=('meson' 'git')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('2b09717c07f68db9a7f2ccf4115ef7351cd9b80f5300870f3bc4545713e9bd6e')

build () {
  arch-meson "${pkgname}-${pkgver}" build
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
}
