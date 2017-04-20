# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=1.1.6
pkgrel=1
pkgdesc="Limiter, compressor, reverberation, stereo equalizer and auto volume effects for Pulseaudio applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(python python-gobject gtk3 gst-plugins-good gst-plugins-bad gst-python
         swh-plugins caps)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('4e91f77b5862c53699758642d77b20df')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  cp -r "share" "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
