# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.1.0
pkgrel=1
pkgdesc="SciELO Publishing Schema XML document front matter metadata reader/sanitizer"
arch=('any')
url='https://github.com/scieloorg/clea'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-numpy' 'python-pandas' 'python-levenshtein'
         'python-regex' 'python-unidecode')
optdepends=('python-flask: development web server'
            'gunicorn: web server alternative')
options=(!emptydirs)
sha256sums=('ffa9861ff942451681f33ec4a825c4481ecbd2317cec69fa196cab92dac5ce76')
source=("https://github.com/scieloorg/clea/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
