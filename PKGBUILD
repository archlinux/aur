# Maintainer: w

pkgname=spokenly
pkgver=1.0.3
pkgrel=1
pkgdesc='Fast voice dictation for your desktop'
arch=('x86_64')
url='https://spokenly.app/'
license=('LicenseRef-Spokenly')
depends=(
  'alsa-lib'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libevdev'
  'libsoup3'
  'libx11'
  'libxtst'
  'webkit2gtk-4.1'
  'libstdc++'
  'libgcc'  
)
provides=('spokenly')
conflicts=('spokenly')
options=('!strip')
source=(
  "Spokenly_${pkgver}_amd64.deb::https://cdn.spokenly.app/releases/linux/Spokenly_${pkgver}_amd64.deb"
  'LICENSE'
)
sha256sums=('271f03e57dc9831089f780acae0cecec2c63672ec0ef4877c173556055428a94'
            '36281e6dc02d369943554f1681ee1aae9d86429fc7a6e5b44b53f6c620b5dffe')

package() {
  bsdtar -xpf data.tar.gz -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
