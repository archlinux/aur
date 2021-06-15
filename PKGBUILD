pkgname=python-frozen-flask
pkgver=0.18
pkgrel=1
pkgdesc='Freezes a Flask application into a set of static files'
url='https://github.com/Frozen-Flask/Frozen-Flask'
license=('BSD')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
source=("https://github.com/Frozen-Flask/Frozen-Flask/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('c91b77d385abfb870b4e620ec96b7755')
sha1sums=('c52dd31eae958515cc9a9b3e32cb9f635a1377c5')
sha256sums=('5e8a2e66a3d068c1a3e903427aea372660b09232126285bec077ac326f70c864')
sha384sums=('f4fc3ea867aa5a20b8264ccec4fb47c6bc9c06264c742a7e11242c3a38ef6c2bde5db222a7e54502f49a1f6eaee37347')
sha512sums=('c34dd3dc94d02a42b775ea8863bd4543d3c720a6d2fc449b8e3e0b051ea12e4d1e538a7d5352ad6ecd2104ce258261c2ed7b2f23b5c334d603715ff42a02c100')
