# Maintainer: Matheus Fillipe <mattf@h4ks.com>

pkgname=obsidianirc-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Modern IRC client with extensive IRCv3 support"
arch=('x86_64' 'aarch64')
url="https://github.com/ObsidianIRC/ObsidianIRC"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
provides=('obsidianirc')
conflicts=('obsidianirc')
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/ObsidianIRC/ObsidianIRC/releases/download/v${pkgver}/ObsidianIRC_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}.deb::https://github.com/ObsidianIRC/ObsidianIRC/releases/download/v${pkgver}/ObsidianIRC_${pkgver}_arm64.deb")
sha256sums_x86_64=('b03190cf8c8fed8082ac2c478ce63fc774d57e952fa86838a779acd1afa4875b')
sha256sums_aarch64=('a13705be3881f0f471c6e01b47297c7c8f02954d92c213dac42a02910ede5383')

package() {
  # Extract .deb archive data
  bsdtar -xf data.tar.* -C "${pkgdir}"
  
  # Fix permissions
  chmod -R u+rwX,go+rX,go-w "${pkgdir}"
}
