# Maintainer: Steven Deobald <sdeobald@gnome.org>
pkgname=savebutton
pkgver=0.2.12
pkgrel=1
pkgdesc='Simple bookmark and notes manager'
arch=('x86_64')
url='https://github.com/lofimx/kaya-gtk'
license=('AGPL-3.0-only')
depends=('gjs' 'gtk4' 'libadwaita' 'libsecret')
makedepends=('meson' 'ninja' 'nodejs' 'npm' 'typescript' 'gettext' 'glib2' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lofimx/kaya-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('140b5b0a0c2a5faade38396558ed97607feca50b22a322502678905bf09e3a00')

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
