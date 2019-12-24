# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname=mopidy-soundcloud
pkgver=3.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from SoundCloud"
arch=('any')
url="https://github.com/mopidy/mopidy-soundcloud"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-pykka'
  'python-setuptools'
  'mopidy>=3.0'
)
source=(
  "https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  '3e2d15ce4ec77c70339e8e4884660c38c4123ba4b8ffe312b6d68f21ebadc5ee6f7999d60ee279dc7491aed1a713833ebd70c50c20f8c73cf32d523e829175e5'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
