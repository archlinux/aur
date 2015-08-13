pkgname=mopidy-soundcloud
_pkgpyname=Mopidy-SoundCloud
pkgver=2.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from SoundCloud"
arch=('any')
url="https://github.com/mopidy/mopidy-soundcloud"
license=('MIT')
depends=(
  'python2'
  'python2-requests'
  'python2-pykka>=1.1'
  'gstreamer0.10-ugly-plugins'
  'mopidy>=1.0'
)
makedepends=('python2')
source=("https://pypi.python.org/packages/source/M/${_pkgpyname}/${_pkgpyname}-${pkgver}.tar.gz")
md5sums=('edb1dbc6d7c494cf093235a500c7d20e')

package() {
  cd "$srcdir/$_pkgpyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
