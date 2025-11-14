# Maintainer: keiko37 <nmp-inbox@proton.me>

pkgname=nmp-settings-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Settings GUI for linux. Extensible with plugins."
arch=('x86_64')
url="https://github.com/nmp-apps/nmp-settings"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'glib2' 'gtk3' 'wayland' 'gdk-pixbuf2' 'libsoup3' 'openssl' 'cairo' 'webkit2gtk-4.1' 'xdotool' 'hicolor-icon-theme')
makedepends=('git' 'tar')
provides=('nmp-settings')
conflicts=('nmp-settings')
source=("https://github.com/nmp-apps/nmp-settings/releases/download/v${pkgver}/NmpSettings_${pkgver}_amd64.tar.gz")
sha256sums=('19c2c56fad4ca0163a227615e1469ed0b0817ecf87c126809376d6d44f5b317f')

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  tar -xzvf "$srcdir/NmpSettings_${pkgver}_amd64.tar.gz" -C "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -r ./* "$pkgdir/usr/"
}
