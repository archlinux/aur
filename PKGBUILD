# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=minbrowser-bin
pkgver=1.21.0
pkgrel=1
pkgdesc='A fast, minimal browser that protects your privacy'
arch=('x86_64')
url='https://minbrowser.org/'
license=('Apache')
# Help needed with the depends
depends=(
  'cairo'
  'dbus'
  'glib2'
  'gtk3'
  'nss'
  'pango'
)
optdepends=(
  'libgnome-keyring'
  'pulseaudio'
)
provides=('minbrowser')
conflicts=('minbrowser')
source=("https://github.com/minbrowser/min/releases/download/v${pkgver}/min_${pkgver}_amd64.deb")
md5sums=(
  'd1f94157a9b8bbf632b59ee48cd5d053'
)
sha1sums=(
  'de7ea30df6a62a95dfe6b3022d432c83737650d9'
)
sha256sums=(
  '6d5e94723456abd6426a45af3c977a410a534de354cb820bd55881781f73f706'
)
sha512sums=(
  '9e9ae847dc0cbbffdea3114c20bd009e974d2f6b469e0f1c4474b73dd4e509c8cb87a1e889a12340d48cdd6bcf40186fff330164f6106a9d6be5f4e7cc6762b9'
)
b2sums=(
  '005f9114fa5f8ee0a2dc41a5c7a9c3d0f4d74aa328cb449604032c87a121cf5c895dfce2066921c39c1c36203afc8f12f8ae6e40a73665f1c1b6777e6eeeb9df'
)

package() {
  tar xf data.tar.xz -C "$pkgdir"
}

post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}

post_upgrade() {
  post_install
}

post_remove() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}

# eof
