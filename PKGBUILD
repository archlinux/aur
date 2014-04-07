# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>

pkgname=midori
pkgver=0.5.8
pkgrel=1
pkgdesc='Lightweight web browser (GTK2)'
arch=('x86_64' 'i686')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
install='midori.install'
depends=('libzeitgeist' 'webkitgtk2' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libunique')
makedepends=('bzr' 'python2' 'intltool' 'vala' 'librsvg' 'cmake')
optdepends=('aria2: download utility')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('af19135fd4c4b04345df4d3592e7939c20f9b40eaca24550e6cb619751aa9381')

build() {
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
