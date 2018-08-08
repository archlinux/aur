pkgname=python-frozen-flask
pkgver=0.15
pkgrel=1
pkgdesc='Freezes a Flask application into a set of static files'
url='https://github.com/Frozen-Flask/Frozen-Flask'
license=('BSD')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
source=("https://github.com/Frozen-Flask/Frozen-Flask/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('695780c2a4989cccb4a686fe899dc437')
sha1sums=('10aeadc0533f027b37cf425219931117f53bccb4')
sha256sums=('de0f6f9ced4dcc6869e97a75b3113065b6f7a04845e01f869f93112e874ba034')
sha384sums=('72b30381af018156a7a5870d3a3d38e5b72ddfe05b9a060d90f3d18d79cdefae9d8a63c44dd22ae95751a1e6d4b12201')
sha512sums=('fe3074efab7694ce464428d5c3ae6a781219565209ada950387ab017af14a2407540894efca9f5f619cf8625b81b8fd098662fde2666447dc3974e0f00fcc89a')
