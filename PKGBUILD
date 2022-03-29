# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=mlbv
pkgver=0.0.19
pkgrel=1
pkgdesc='Command-line interface to MLB game information, schedule, scores, and standings.'
arch=('any')
url='https://github.com/kmac/mlbv'
license=('GPL3')
depends=('python-dateutil' 'python-lxml' 'python-pytz' 'python-requests' 'streamlink')
makedepends=('python-setuptools')
# See https://pypi.orgrg/project/mlbv/#files
source=("https://files.pythonhosted.org/packages/57/c4/60f3ebdd5eb588a5c74ca404668f29ea6298dcea9d27e1d86d95a2950399/mlbv-$pkgver.tar.gz")
sha256sums=('318b71027a9cc9e2550f41f234051a505fef437d893a5439935678ab1a73159c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  cp mlbv-fzf "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
