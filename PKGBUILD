# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=pulseaudio-equalizer-ladspa
pkgver=2.7.1
pkgrel=2
pkgdesc="A 15-band equalizer for PulseAudio"
arch=('any')
url="https://github.com/FFY00/pulseaudio-equalizer-ladspa"
license=('GPL3')
depends=('pygtk' 'swh-plugins' 'gnome-icon-theme' 'pulseaudio' 'bc' 'python2-gobject')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'ladspa_lib_path.sh')
sha256sums=('136cc75fdda5b099f5b5b55564cd0c1a42e5c29f70def668c9d95eb8ee83a8ff'
	    'cadad5c6257fdd3a91fa2d5caf88d23aa7e59e4cc19f25a39c3bc888994ed950')

package() {
  install -Dm644 "$srcdir"/pulseaudio-equalizer-ladspa-$pkgver/equalizerrc "$pkgdir"/usr/equalizerrc

  cp -dr --no-preserve=ownership "$srcdir"/pulseaudio-equalizer-ladspa-$pkgver/share "$pkgdir"/usr/
  cp -dr --no-preserve=ownership "$srcdir"/pulseaudio-equalizer-ladspa-$pkgver/bin "$pkgdir"/usr/

  mkdir -p "$pkgdir"/etc/profile.d
  cp "$srcdir"/ladspa_lib_path.sh "$pkgdir"/etc/profile.d/ladspa_lib_path.sh
}
