# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=gnome-calls
pkgver=0.3.4
pkgrel=1
pkgdesc="A phone dialer and call handler for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/calls"
license=('GPL')
#groups=('gnome-extra')
depends=('gst-plugins-good' 'gsettings-desktop-schemas' 'callaudiod' 'libgee'
	 'evolution-data-server' 'feedbackd' 'folks' 'gdk-pixbuf2' 'gom' 
	 'gstreamer' 'gtk3' 'libhandy' 'libmm-glib' 'libpeas' 'libsecret'
	 'sofia-sip' 'wayland' 'modemmanager')
makedepends=('mesa' 'ninja' 'desktop-file-utils')
optdepends=('ofono: Alternate Cellphone backend')
source=("https://gitlab.gnome.org/GNOME/calls/-/archive/v${pkgver}/calls-v${pkgver}.tar.gz")
sha256sums=('97cd5f689b9f1312b97ad99a44d10d35774a7d2b58d92446aa0101d2d11bfdf9')


build() {
  cd "calls-v${pkgver}"
  arch-meson . _build
  meson compile -C _build
}


package() {
  cd "calls-v${pkgver}"
  meson install -C _build --destdir "${pkgdir}"
}
