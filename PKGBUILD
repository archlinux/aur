# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.4.0
pkgrel=1
pkgdesc="SciELO Publishing Schema XML document front matter metadata reader/sanitizer"
arch=('any')
url='https://github.com/scieloorg/clea'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-numpy' 'python-levenshtein'
         'python-ujson' 'python-click'
         'python-regex' 'python-unidecode')
optdepends=('python-flask: development web server'
            'gunicorn: web server alternative')
options=(!emptydirs)
sha256sums=('4148aa295f9e9a827478e9f557d96c6c716bcac70593e26bde7e756fc3d89ed1')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
