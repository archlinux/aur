# Maintainer:
pkgname=limbus-localization-manager-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple tool for managing Limbus Company localizations"
arch=('x86_64')
url="https://github.com/kimght/LimbusLocalizationManager"
license=('LicenseRef-Unknown')
depends=(
  'cairo'
  'desktop-file-utils'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
  'xz'
)
provides=("limbus-localization-manager=$pkgver")
conflicts=('limbus-localization-manager')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/LimbusLocalizationManager_${pkgver}_amd64.deb")
noextract=("$pkgname-$pkgver.deb")
sha256sums=('173e6759632ce3cd1b6e90fb72f126bb838ac3e6f4610620799a3bf4464346ee')

package() {
  bsdtar -xOf "$srcdir/$pkgname-$pkgver.deb" data.tar.gz | bsdtar -xzf - --no-same-owner -C "$pkgdir"
}
