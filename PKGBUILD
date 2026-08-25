# Maintainer: swarnimcodes <swarnim14.9 at hotmail dot com>

pkgname=spotagooey-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Desktop Spotify client built with Tauri, Rust, React, and TypeScript'
arch=('x86_64')
url='https://github.com/swarnimcodes/spotagooey'
license=('MIT')
depends=(
  'alsa-lib'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libgcc'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
provides=("spotagooey=${pkgver}")
conflicts=('spotagooey')
options=('!strip' '!debug')
source=('LICENSE')
sha256sums=('4b3b7f8c2a7cb09753ab53ecaf6cecaaeb1d0760c3e4f82bc3ced5aab2708e0f')
source_x86_64=(
  "${pkgname}-${pkgver}.deb::https://github.com/swarnimcodes/spotagooey/releases/download/v${pkgver}/spotagooey_${pkgver}_amd64.deb"
)
sha256sums_x86_64=(
  '031bf6f12f27aeb5895eccfa6e1e59fcc5052343f0123c73c7a6ded77eb4e43c'
)

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.gz
  bsdtar -xzf data.tar.gz --no-same-owner -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
