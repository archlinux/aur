pkgname=mopidy-soundcloud
_pkgpyname=Mopidy-SoundCloud
pkgver=2.0.2
pkgrel=2
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
makedepends=('python2')
source=("https://pypi.python.org/packages/source/M/${_pkgpyname}/${_pkgpyname}-${pkgver}.tar.gz")
sha512sums=('d517ec4e1fcb27cee1910fb7a580fcda2ab8aa28f8c8e31e2a4dfa40ebd99e8b5e69b85b5d023d9c4a052e832c506596bcd48aeb0e0baf52d09174a29a74fabe')

package() {
  cd "$srcdir/$_pkgpyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
