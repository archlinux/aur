# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.2.1
pkgrel=1
pkgdesc="SciELO Publishing Schema XML document front matter metadata reader/sanitizer"
arch=('any')
url='https://github.com/scieloorg/clea'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-numpy' 'python-levenshtein'
         'python-regex' 'python-unidecode')
optdepends=('python-flask: development web server'
            'python-pandas: using clea.join.aff_contrib_full_outer_join_dframe'
            'gunicorn: web server alternative')
options=(!emptydirs)
sha256sums=('14d76bd509efb718e172a4d7b8059e9d3b89dfd22575f8787066ad1b2bf1a071')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
