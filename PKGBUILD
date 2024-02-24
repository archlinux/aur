# Maintainer: spider-mario <spidermario@free.fr>
pkgname=vocoder-ladspa
pkgver=0.4
pkgrel=2
pkgdesc="Vocoder LADSPA plugin"
arch=('i686' 'x86_64')
url="http://www.sirlab.de/linux/download_vocoder_ladspa.html"
license=('GPL-2.0-or-later')
groups=('multimedia')
depends=('glibc')
makedepends=('ladspa')
source=(http://www.sirlab.de/linux/vocoder/download/$pkgname-$pkgver.tgz)
b2sums=('854890ae7f9517ca598e91e05a8c99af2d56a3c05df60e6d57f6783ccb5e96a64bc7b8da587af20d01f9c9b172258a43c5d46529191d256e4566b4a57b5f3b56')

build() {
  cd "$srcdir/vocoder-$pkgver"
  make
}

package() {
  cd "$srcdir/vocoder-$pkgver"
  install -Dm644 vocoder.so "$pkgdir"/usr/lib/ladspa/vocoder.so
}

# vim:set ts=2 sw=2 et:
