# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=1.0.8
pkgrel=1
pkgdesc="Limiter, reverberation and stereo equalizer effects for Pulseaudio applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(python python-gobject gtk3 gst-plugins-good gst-plugins-bad gst-python
         swh-plugins caps)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('039ce6ecdcc0378c5c3346fa25e620c6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/glib-2.0/schemas"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cp "share/glib-2.0/schemas/com.github.wwmm.pulseeffects.gschema.xml" \
     "$pkgdir/usr/share/glib-2.0/schemas"
  cp "share/applications/pulseeffects.desktop" "$pkgdir/usr/share/applications"
  cp "share/icons/hicolor/scalable/apps/pulseeffects.svg" \
     "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}

# vim:set ts=2 sw=2 et:
