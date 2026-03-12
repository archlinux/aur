# Maintainer: Steven Deobald <sdeobald@gnome.org>
pkgname=savebutton
pkgver=0.2.10
pkgrel=1
pkgdesc='Simple bookmark and notes manager'
arch=('x86_64')
url='https://github.com/lofimx/kaya-gtk'
license=('AGPL-3.0-only')
depends=('gjs' 'gtk4' 'libadwaita' 'libsecret')
makedepends=('meson' 'ninja' 'nodejs' 'npm' 'typescript' 'gettext' 'glib2' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lofimx/kaya-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('afcea54add95b1dd5f47f3bc2f5613f5217c33c89d53d18d9471730a106d34cf')

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
