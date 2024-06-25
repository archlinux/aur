# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=darling
pkgname=$_pkgname-bin
pkgver=0.1.20230310
pkgrel=1
pkgdesc="Darwin/macOS emulation layer for Linux"
arch=('x86_64')
url="https://github.com/darlinghq/darling"
license=('GPL')
groups=('darling-bin')
provides=('darling')
conflicts=('darling' 'darling-git')
depends=(
  cairo
  dbus
  ffmpeg
  freetype2
  fuse2
  giflib
  glibc
  glu
  libgl
  libglvnd
  libjpeg-turbo
  libpng
  libpulse
  libtiff
  libx11
  libxcursor
  libxext
  libxkbfile
  libxrandr)
optdepends=('libtiff5: Library for manipulation of TIFF images')
source=("$url/releases/download/v${pkgver}_update_sources_11_5/${_pkgname}_${pkgver}.jammy_amd64.deb")
sha512sums=('f15bc3b0fa5754d1dfcd5d76c1c24adbf64fd53c2ec880d85df7551a3ecb522299f58a1ad8203618a372fd3b1ccd339e6074d57066b8d55fc2b7f614f61cd9bc')
options=('!strip')
install=$pkgname.install

package() {
  # Extract package data
  cd "$pkgdir"
  tar xf "$srcdir/data.tar.zst"

  install -Dm644 \
    usr/libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/share/ri/2.6.0/system/Gem/SpecificationPolicy/validate_licenses-i.ri \
    usr/share/licenses/$pkgname/LICENSE

  install -Dm644 usr/share/doc/darling/copyright \
    usr/share/licenses/$pkgname/COPYRIGHT
}
