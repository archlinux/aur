# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=pulseaudio-equalizer-ladspa-ffy00-git
pkgver=1.0.r0.4856f57
pkgrel=3
pkgdesc="A 15-band equalizer for PulseAudio (FFY00's fork)"
arch=(any)
url="https://github.com/FFY00/pulseaudio-equalizer-ladspa"
license=('GPL3')
depends=('pygtk' 'swh-plugins' 'gnome-icon-theme' 'pulseaudio' 'bc' 'python2-gobject')
makedepends=('git')
provides=('pulseaudio-equalizer-ladspa')
conflicts=('pulseaudio-equalizer-ladspa')
replaces=('pulseaudio-equalizer-ladspa')
source=('remote::git+https://github.com/FFY00/pulseaudio-equalizer-ladspa')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/remote"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

package() {
  install -Dm644 "$srcdir/remote/equalizerrc" "$pkgdir/usr/equalizerrc"

  cp -r "$srcdir/remote/share" "$pkgdir/usr/"
  cp -r "$srcdir/remote/bin" "$pkgdir/usr/"
}
