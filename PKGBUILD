# Maintainer:  Alexander Rødseth <rodseth@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.5.5
pkgrel=1
pkgdesc='Lightweight web browser (GTK2)'
arch=('x86_64' 'i686')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
install='midori.install'
depends=('libzeitgeist' 'webkitgtk2' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libunique')
makedepends=('bzr' 'python2' 'intltool' 'vala' 'librsvg')
optdepends=('gstreamer0.10-base-plugins: HTML5 OGG videos support'
            'gstreamer0.10-bad-plugins: HTML5 WebM videos support'
            'gstreamer0.10-ffmpeg: HTML5 H264 videos support'
            'aria2: download utility')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('ca69382a285222a86028abebd73fed1976735883027ff0adc094b627789bbd62')

build() {
  cd "$srcdir/$pkgname-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
