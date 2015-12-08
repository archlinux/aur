# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-alarm-plugin
pkgver=0.3.0
pkgrel=1
pkgdesc="Tomate plugin that shows screen notifications"
arch=('any')
url="https://github.com/eliostvs/tomate-notify-plugin"
license=('GPL')
depends=('gtk3'
         'python'
         'gstreamer'
         'gst-plugins-base'
         'gst-plugins-good'
         'tomate-gtk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('19026e8ad56ef54b5cacd66c46747e14')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et: