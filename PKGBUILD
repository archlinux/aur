# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=1.5.0
pkgrel=1
pkgdesc="Limiter, compressor, reverberation, stereo equalizer and auto volume effects for Pulseaudio applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(python python-gobject python-cairo gtk3 gst-plugins-good gst-plugins-bad
         gst-python swh-plugins)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('6ac4b33a7c05b1540c45ab50a47508b3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  cp -r "share" "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
