# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=tuner
pkgver=1.5.1
pkgrel=3
pkgdesc="Minimalist radio station player. Geared towards RadioBrowser"
arch=('x86_64' 'i686')
url="https://github.com/louis77/$pkgname"
license=('GPL3')
depends=('granite' 'libsoup' 'gst-plugins-bad-libs' 'geoclue' 'geocode-glib')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bbb5e7c97da1ee495651d85aca33c2fe58daba81906ae247e12b6a41b1ed7592')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
}
