# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.2.0
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
sha256sums=('07d7ebad83e57558256bef76dc9d35a10549f3859faedd6da65c548f5b43ae0a')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
