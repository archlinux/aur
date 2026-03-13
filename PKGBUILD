# Maintainer: Steven Deobald <sdeobald@gnome.org>
pkgname=savebutton
pkgver=0.2.14
pkgrel=1
pkgdesc='Simple bookmark and notes manager'
arch=('x86_64')
url='https://github.com/lofimx/kaya-gtk'
license=('AGPL-3.0-only')
depends=('gjs' 'gtk4' 'libadwaita' 'libsecret')
makedepends=('meson' 'ninja' 'nodejs' 'npm' 'typescript' 'gettext' 'glib2' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lofimx/kaya-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e55a7b5eaac1e8a6ae4562e92909eb93793bc37e62ef96a3110494b83eea307b')

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
