# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.1.1
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
sha256sums=('0d7779f8bcc4345e29fece9b381f8d187eb23128ffea25c58af8bea005ed6876')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
