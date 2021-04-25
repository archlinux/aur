# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=mlbv
pkgver=0.0.18
pkgrel=2
pkgdesc='Command-line interface to MLB game information, schedule, scores, and standings.'
arch=('any')
url='https://github.com/kmac/mlbv'
license=('GPL3')
depends=('python-requests' 'python-lxml' 'python-dateutil' 'streamlink')
makedepends=('python-setuptools')
# See https://pypi.org/project/mlbv/#files
source=("https://files.pythonhosted.org/packages/16/e8/7a22675c337f370167f79bf16a952443e32e617596077411183c3dc3b5e0/mlbv-$pkgver.tar.gz")
md5sums=('cd93e5620f3991c98c8473ad46d9c00e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  cp mlbv-fzf "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
