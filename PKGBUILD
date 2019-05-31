# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.3.1
pkgrel=1
pkgdesc="SciELO Publishing Schema XML document front matter metadata reader/sanitizer"
arch=('any')
url='https://github.com/scieloorg/clea'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-lxml' 'python-numpy' 'python-levenshtein'
         'python-regex' 'python-unidecode')
optdepends=('python-flask: development web server'
            'gunicorn: web server alternative')
options=(!emptydirs)
sha256sums=('bd02a3fdb0da34260ce5f023e5fe5f439d4fdcfab789850eb8d227a4dc3c20db')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
