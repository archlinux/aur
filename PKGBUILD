# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=pulseaudio-equalizer-ladspa
pkgver=2.7.1
pkgrel=1
pkgdesc="A 15-band equalizer for PulseAudio"
arch=(any)
url="https://github.com/FFY00/pulseaudio-equalizer-ladspa"
license=('GPL3')
depends=('pygtk' 'swh-plugins' 'gnome-icon-theme' 'pulseaudio' 'bc' 'python2-gobject')
makedepends=('git')
provides=('pulseaudio-equalizer-ladspa')
conflicts=('pulseaudio-equalizer-ladspa')
source=("https://github.com/FFY00/pulseaudio-equalizer-ladspa/archive/v$pkgver.tar.gz")
sha256sums=('136cc75fdda5b099f5b5b55564cd0c1a42e5c29f70def668c9d95eb8ee83a8ff')

package() {
  install -Dm644 "$srcdir/pulseaudio-equalizer-ladspa-$pkgver/equalizerrc" "$pkgdir/usr/equalizerrc"

  cp -dr --no-preserve=ownership "$srcdir/pulseaudio-equalizer-ladspa-$pkgver/share" "$pkgdir/usr/"
  cp -dr --no-preserve=ownership "$srcdir/pulseaudio-equalizer-ladspa-$pkgver/bin" "$pkgdir/usr/"
}
