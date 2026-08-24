# Maintainer: w

pkgname=spokenly
pkgver=0.3.17
pkgrel=1
pkgdesc='Fast voice dictation for your desktop'
arch=('x86_64')
url='https://spokenly.app/'
license=('LicenseRef-Spokenly')
depends=(
  'alsa-lib'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libevdev'
  'libsoup3'
  'libx11'
  'libxtst'
  'webkit2gtk-4.1'
)
provides=('spokenly')
conflicts=('spokenly')
options=('!strip')
source=(
  "Spokenly_${pkgver}_amd64.deb::https://cdn.spokenly.app/releases/linux/Spokenly_${pkgver}_amd64.deb"
  'LICENSE'
)
sha256sums=('b36175ffcfef75dbb33af52089be71448fa47d17609f02dd83de1e9230e21695'
            '36281e6dc02d369943554f1681ee1aae9d86429fc7a6e5b44b53f6c620b5dffe')

package() {
  bsdtar -xpf data.tar.gz -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
