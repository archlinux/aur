# Maintainer: Philipp Joram < mail [at] phijor [dot] me>

pkgname=mopidy-soundcloud
pkgver=2.1.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from SoundCloud"
arch=('any')
url="https://github.com/mopidy/mopidy-soundcloud"
license=('MIT')
depends=(
  'python2'
  'python2-requests'
  'python2-pykka>=1.1'
  'gst-plugins-ugly'
  'mopidy>=1.0'
)
makedepends=('python2-setuptools')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4e65b54469d92a754edebc9e5b9d3933ca9f28db0c4f97e6c80269de796b1c97cface99b01d5bb956c4295016757accdad437baba040a452260ac7be3db3e870')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
