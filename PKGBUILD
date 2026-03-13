# Maintainer: Steven Deobald <sdeobald@gnome.org>
pkgname=savebutton
pkgver=0.2.13
pkgrel=1
pkgdesc='Simple bookmark and notes manager'
arch=('x86_64')
url='https://github.com/lofimx/kaya-gtk'
license=('AGPL-3.0-only')
depends=('gjs' 'gtk4' 'libadwaita' 'libsecret')
makedepends=('meson' 'ninja' 'nodejs' 'npm' 'typescript' 'gettext' 'glib2' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lofimx/kaya-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e43f93453676504f1d8c34561b2789a603dad38a2f369e9a3de63d2a4e21bc71')

build() {
  cd "kaya-gtk-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "kaya-gtk-${pkgver}"
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
