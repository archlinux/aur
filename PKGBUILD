# Maintainer: Polyfrost <contact@atmofrost.org>
pkgname=oneclient-bin
_appname=OneClient
pkgver=2.2.3
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
)
provides=('oneclient')
conflicts=('oneclient')
options=('!strip')
_debfile="${_appname}_${pkgver}_linux_x86_64.deb"
source=("${_debfile}::${url}/releases/download/oneclient-${pkgver}/${_debfile}")
sha256sums=('b87d5ae23c96e82620e68c931f3626c723da7e86561117754749dda2f6cd6dc3')

package() {
  cd "$pkgdir"
  bsdtar -xf "$srcdir/$_debfile"
  bsdtar -xf data.tar.*
  rm -f debian-binary control.tar.* data.tar.*

  ln -s oneclient_app "$pkgdir/usr/bin/oneclient"
}
