# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=gnome-calls
pkgver=41.0
pkgrel=1
pkgdesc="A Phone Dialer And Call Handler For GNOME"
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
conflicts=('calls')
source=("https://gitlab.gnome.org/GNOME/calls/-/archive/${pkgver}/calls-${pkgver}.tar.gz")
sha256sums=('c6ccd265f4eec611eaac3b3920fd1127179d1946adcd2a4adfca9c304168b01f')

build() {
  cd "calls-${pkgver}"
  arch-meson . _build
  meson compile -C _build
}


package() {
  cd "calls-${pkgver}"
  meson install -C _build --destdir "${pkgdir}"
}
