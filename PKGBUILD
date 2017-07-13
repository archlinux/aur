# Maintainer: Philipp Joram < mail [at] phijor [dot] me>

pkgname=mopidy-soundcloud
pkgver=2.0.2
pkgrel=3
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
sha512sums=('ee694a66f9ed701b224011c8cb25e0882000b3ea12137fed6bf83a4a82885cfb50759c18e2ff4de7109b1ec32320aeb9603dc5c77979468d7259a067fe55c827')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
