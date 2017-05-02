# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=1.2.6
pkgrel=2
pkgdesc="Limiter, compressor, reverberation, stereo equalizer and auto volume effects for Pulseaudio applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(python python-gobject python-cairo gtk3 gst-plugins-good gst-plugins-bad gst-python
         swh-plugins)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('90cae145e15e3c5c958ffd5f872c1ec0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  cp -r "share" "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
