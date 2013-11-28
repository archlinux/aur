# Maintainer:  Alexander Rødseth <rodseth@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>

pkgname=midori
pkgver=0.5.6
pkgrel=2
pkgdesc='Lightweight web browser (GTK2)'
arch=('x86_64' 'i686')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
install='midori.install'
depends=('libzeitgeist' 'webkitgtk2' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libunique')
makedepends=('bzr' 'python2' 'intltool' 'vala' 'librsvg' 'cmake')
optdepends=('gstreamer0.10-base-plugins: HTML5 OGG videos support'
            'gstreamer0.10-bad-plugins: HTML5 WebM videos support'
            'gstreamer0.10-ffmpeg: HTML5 H264 videos support'
            'aria2: download utility')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('c5be1b5d9933776f09c5cab7945a073a820d65555e51fda9ff55fd063843f24a')

build() {
  cd "$pkgname-$pkgver"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C "$pkgname-$pkgver/build" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
