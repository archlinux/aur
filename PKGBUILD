# Maintainer: Polyfrost <contact@atmofrost.org>
pkgname=oneclient-bin
_appname=OneClient
pkgver=2.8.0
pkgrel=1
pkgdesc="Next-generation open source Minecraft launcher (prebuilt)"
arch=('x86_64')
url="https://github.com/Polyfrost/OneLauncher"
license=('GPL-3.0-only')
depends=(
  'fontconfig'
  'freetype2'
  'libglvnd'
  'libxcursor'
  'libxrandr'
  'libxi'
  'libxkbcommon'
  'wayland'
  'dbus'
  'gtk3'
  'libayatana-appindicator'
)
provides=('oneclient')
conflicts=('oneclient')
options=('!strip')
_debfile="${_appname}_${pkgver}_linux_x86_64.deb"
source=("${_debfile}::${url}/releases/download/oneclient-${pkgver}/${_debfile}")
sha256sums=('8ac0ea645b78bcd2a9e13cb14e4ab22cc732ddf33b7bea88375cfcba4114d536')

package() {
  cd "$pkgdir"
  bsdtar -xf "$srcdir/$_debfile"
  bsdtar -xf data.tar.*
  rm -f debian-binary control.tar.* data.tar.*

  ln -s oneclient_app "$pkgdir/usr/bin/oneclient"
}
