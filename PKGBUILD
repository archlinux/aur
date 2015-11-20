pkgname=mopidy-soundcloud
_pkgpyname=Mopidy-SoundCloud
pkgver=2.0.1
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
sha512sums=('7a787c5fb4e55257ab24c133b130ce9b1d129fcf7aa76a028e99b6b6db979748ef87c1c045287cc60612ecdadef0042ab60b2ad9ad4f40d243bb5d9414af3fdb')

package() {
  cd "$srcdir/$_pkgpyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
